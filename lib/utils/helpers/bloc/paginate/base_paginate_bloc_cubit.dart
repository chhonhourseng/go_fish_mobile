import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/rendering.dart';
import 'package:app/export.dart';

abstract class BasePaginateBlocCubit<T> extends Cubit<BasePaginateBlocState<T>> {
  BasePaginateBlocCubit() : super(BasePaginateBlocState<T>());
  final Connectivity _connectivity = AppConnectivity.instance;

  int page = 1;
  final ScrollController scrollController = ScrollController();

// Check if there is network connectivity
  bool get isNetwork => true;

// Check if error bar should be shown
  bool get isShowBarError => true;

// Check if data is empty
  bool get isDataEmpty => state.data == null ? true : state.data!.isEmpty;

// Check if currently loading
  bool get isLoading =>
      (state.stateStatus == AppStateStatus.loading || state.stateStatus == AppStateStatus.none || state.stateStatus == AppStateStatus.initial) &&
      isDataEmpty;

// Check if loading for the first page is complete
  bool get isLoadingOver => state.stateStatus == AppStateStatus.loading && !isDataEmpty && page == 1;

// Check if loading for more data at the bottom
  bool get isLoadingBottom =>
      state.hasNextPage && !isDataEmpty && state.stateStatus != AppStateStatus.failure && state.stateStatus != AppStateStatus.noInternet;

// Check if error occurred while loading more data at the bottom
  bool get isErrorBottom =>
      state.hasNextPage && !isDataEmpty && (state.stateStatus == AppStateStatus.failure || state.stateStatus == AppStateStatus.noInternet);

// Check if end text should be shown
  bool get isEndText => isDataEmpty ? false : state.data!.length > 8 && !state.hasNextPage;

// Check if error bar for no internet should be shown
  bool get isShowBarNoInternet => state.isShowBarNoInternet && !isDataEmpty;

// Check if error bar for under maintenance should be shown
  bool get isShowBarUnderMaintenance => state.isShowBarUnderMaintenance;

// Check if new data should be appended to existing data
  bool get isAppend => true;

  ScrollDirection scrollDirection = ScrollDirection.forward;

// Check if data should be reloaded when reinitialized
  bool get isReInitialLoadData => true;

  //
  String? get noDataErrorText => null;

// Public Methods

  /// Re-fetches the data by calling _getData().
  void reload() => _getData();

  /// Returns the response data as a Future<BaseResponse<List<T>>>.
  @required
  Future<BaseResponse<T>> responseData();

  /// Scrolls to the top of the page.
  void willToTop() {
    try {
      if (scrollController.offset > 2) {
        goTop();
      } else {
        load();
      }
    } catch (_) {
      goTop();
      load();
    }
  }

// Private Methods

  /// Scrolls to the top of the page using scrollController.
  void goTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  /// Initializes the bloc by loading data if required.
  void initial() async {
    if (state.stateStatus != AppStateStatus.none) {
      if (isReInitialLoadData) {
        load();
      }
      return;
    }
    reset();
    load();
  }

  /// Loads the initial data by calling _getData().
  void load() {
    page = 1;
    _getData();
  }

  /// Callback method to handle changes in scroll direction.
  void onChangeScrollDirection(ScrollDirection scrollDirection) {}

  /// Adds a listener to the scrollController.
  void addListenerScroller() {
    scrollController.addListener(initialScrollController);
  }

  /// Removes the listener from the scrollController.
  void removeListenerScroller() {
    try {
      scrollController.removeListener(initialScrollController);
    } catch (_) {}
  }

  /// Delegates the scroll controller event to handle scroll direction changes.
  void onScrollControllerDelegate() {
    if (scrollController.position.userScrollDirection != scrollDirection) {
      scrollDirection = scrollController.position.userScrollDirection;
      onChangeScrollDirection(scrollDirection);
    }
  }

  /// Handles the initial scroll controller event and calls _getData() if required.
  void initialScrollController() {
    onScrollControllerDelegate();
    if (!state.hasNextPage || isErrorBottom || state.stateStatus == AppStateStatus.loading) {
      return;
    }
    if (scrollController.position.atEdge) {
      if (scrollController.position.pixels != 0) {
        log('getting data1');
        _getData();
      }
    }
// // * call get data before edge
// if (scrollController.position.pixels > (scrollController.position.maxScrollExtent)) {
// log('getting data1');
// this._getData();
// }
  }

  /// Handles the scroll notification and calls _getData() if required.
  bool initialScrollNotification(ScrollNotification scrollInfo) {
    if (!state.hasNextPage || isErrorBottom || state.stateStatus == AppStateStatus.loading) {
      return true;
    }
    if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
      log('getting data2');
      _getData();
    }
// //* call get data before edge
// if (scrollInfo.metrics.extentAfter < 1000) {
// log('getting data2');
// _getData();
// }
    return true;
  }

  /// Checks the internet connectivity.
  Future<bool> checkConnectivity() async {
    if (!kDebugMode) {
      final connectivityResult = await _connectivity.checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        emit(state.copyWith(
          stateStatus: AppStateStatus.noInternet,
          message: "no_internet_connection",
        ));
        return false;
      }
    }
    return true;
  }

  /// Delegates the item data to be returned as a Future<List<T>?>.
  Future<List<T>?> itemDelegate(List<T>? data) async {
    return data;
  }

  /// Delegates the item data to be returned as a Future<Map<String, T>?>.
  Future<Map<String, T>?> mapItemDelegate(List<T>? data) async {
    return null;
  }

  /// Fetches the data and updates the state accordingly.
  void _getData() async {
    if (state.stateStatus == AppStateStatus.loading) return;
    emit(state.copyWith(stateStatus: AppStateStatus.loading));
    if (isNetwork) {
      final _checkConnectivity = await checkConnectivity();
      if (!_checkConnectivity) {
        return;
      }
    }
    try {
      final response = await responseData();
      if (response.list?.isEmpty ?? true) {
        emit(
          state.copyWith(
            stateStatus: state.data == null ? AppStateStatus.empty : (page == 1 ? AppStateStatus.empty : AppStateStatus.success),
            hasNextPage: false,
            data: page == 1 ? [] : null,
          ),
        );
      } else {
        var newList = state.data;
        final item = await itemDelegate(response.list);
        if (newList == null || page == 1) {
          newList = item;
        } else {
          if (isAppend) {
            newList = [...newList, ...item!];
          } else {
            newList = [...item!, ...newList];
          }
        }
        final mapData = await mapItemDelegate(newList);
        final newState = state.copyWith(
          stateStatus: AppStateStatus.success,
          data: newList,
          mapData: mapData,
          hasNextPage: response.isNext,
        );
        page = page + 1;
        emit(newState);
      }
    } catch (error) {
      emit(state.copyWith(stateStatus: AppStateStatus.failure));
    }
  }

  void reset() {
    emit(BasePaginateBlocState<T>());
  }
}
