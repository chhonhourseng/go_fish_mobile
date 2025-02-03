import 'dart:async';

import 'package:app/export.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

abstract class BaseListBlocCubit<K> extends Cubit<BaseListBlocState<K>> {
  final Connectivity _connectivity = AppConnectivity.instance;

  BaseListBlocCubit() : super(BaseListBlocState<K>());

// Checks if the data is empty
  bool get isDataEmpty => state.data == null ? true : state.data!.isEmpty;

// Checks if the bloc is currently loading
  bool get isLoading =>
      (state.stateStatus == AppStateStatus.loading || state.stateStatus == AppStateStatus.none || state.stateStatus == AppStateStatus.initial) &&
      isDataEmpty;

// Checks if the loading process is over
  bool get isLoadingOver => state.stateStatus == AppStateStatus.loading && !isDataEmpty;

// Checks if the bar for no internet connection should be shown
  bool get isShowBarNoInternet => state.isShowBarNoInternet && !isDataEmpty;

// Checks if the request was successful
  bool get isSuccess => state.stateStatus == AppStateStatus.success;

// Checks if the bar for under maintenance should be shown
  bool get isShowBarUnderMaintenance => state.isShowBarUnderMaintenance;

// Checks if the bar for error should be shown
  bool get isShowBarError => true;

//
  String? get noDataErrorText => null;

// Returns the response data
  @required
  Future<BaseResponse<K>> responseData([String? id, dynamic data]);

// Delegate method called at the end of the request
  void endRequestDelegate() {}

// Initiates a request
  void request({String? id, dynamic data}) async {
    if (state.stateStatus == AppStateStatus.loading) return;

    // Updates the state to loading
    emit(
      state.copyWith(stateStatus: AppStateStatus.loading),
    );

// Checks connectivity
    final _checkConnectivity = await checkConnectivity();
    if (!_checkConnectivity) {
      return;
    }

    try {
      // Calls the response data method
      final response = await responseData(id, data);
      final result = response.list;

      // Updates the state based on the response
      if (result == null ? false : result.isNotEmpty) {
        emit(
          state.copyWith(
            stateStatus: AppStateStatus.success,
            data: result,
          ),
        );
        endRequestDelegate();
      } else {
        emit(
          state.copyWith(
            stateStatus: AppStateStatus.empty,
          ),
        );
        endRequestDelegate();
      }
    } catch (e) {
      // Handles request failure
      emit(
        state.copyWith(
          stateStatus: AppStateStatus.failure,
          message: e.toString(),
        ),
      );
      endRequestDelegate();
    }
  }

// Checks connectivity status
  Future<bool> checkConnectivity() async {
    if (!kDebugMode) {
      final connectivityResult = await _connectivity.checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        emit(state.copyWith(stateStatus: AppStateStatus.noInternet, message: "no_internet_connection"));
        logError('No Internet connection');
        return false;
      }
    }
    return true;
  }

// Resets the state
  void reset() {
    emit(BaseListBlocState<K>());
  }
}
