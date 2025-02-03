import 'dart:async';
import 'package:app/export.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

abstract class BaseBlocCubit<K> extends Cubit<BaseBlocState<K>> {
  final Connectivity _connectivity = AppConnectivity.instance;

  BaseBlocCubit() : super(BaseBlocState<K>());

  // Returns true if the stateStatus indicates loading
  bool get isLoading =>
      state.stateStatus == AppStateStatus.loading || state.stateStatus == AppStateStatus.initial || state.stateStatus == AppStateStatus.none;

  // Returns true if the stateStatus indicates an error
  bool get isError => state.stateStatus == AppStateStatus.failure || state.stateStatus == AppStateStatus.noInternet;

  // Returns true if the stateStatus indicates success
  bool get isSuccess => state.stateStatus == AppStateStatus.success;

  // Returns true if isShowBarUnderMaintenance is true and data is null
  bool get isShowBarUnderMaintenance => state.isShowBarUnderMaintenance && state.data == null;

  // Returns false, indicating that resetting is not necessary after a request success
  bool get isResetAfterRequestSuccess => false;

  //
  String? get noDataErrorText => null;

  //
  bool get isShowSnackBarError => false;

  // Retrieves the response data for a request
  @required
  Future<BaseResponse<K>> responseData([String? id, dynamic data, dynamic subData, bool isNetwork = true]);

  // Sends a request
  Future request({String? id, dynamic data, dynamic subData, bool isNetwork = true}) async {
    // If the stateStatus indicates loading is true, return
    if (state.stateStatus == AppStateStatus.loading) {
      return;
    }

    // Set the stateStatus to loading
    emit(state.copyWith(stateStatus: AppStateStatus.loading));

    if (isNetwork) {
      // Check connectivity
      final _checkConnectivity = await checkConnectivity();
      if (!_checkConnectivity) {
        return;
      }
    } else {
      // Set isShowBarUnderMaintenance to false
      emit(state.copyWith(
        isShowBarUnderMaintenance: false,
      ));
    }

    try {
      // Get the response from responseData
      final response = await responseData(id, data, subData, isNetwork);

      if (response.data == null) {
        // Set the stateStatus to empty if the response result is null
        emit(
          state.copyWith(
            stateStatus: AppStateStatus.empty,
          ),
        );
      }

      // Set the stateStatus to success and update the data with the response result
      emit(
        state.copyWith(
          stateStatus: AppStateStatus.success,
          data: response.data,
        ),
      );

      if (isResetAfterRequestSuccess) {
        // Reset the state if isResetAfterRequestSuccess is true
        reset();
      }
    } catch (e) {
      if (kDebugMode) {
        // Handle error in debug mode
      }
      // Set the stateStatus to failure and update the message with the error
      emit(
        state.copyWith(
          stateStatus: AppStateStatus.failure,
          message: e.toString(),
        ),
      );
      if (isShowSnackBarError) {
        app.snackBar.show(e.toString(), type: SnackBarType.error);
      }
    }
  }

  // Checks connectivity and returns a boolean indicating the result
  Future<bool> checkConnectivity() async {
    if (!kDebugMode) {
      final connectivityResult = await _connectivity.checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        // Set the stateStatus to noInternet and update the message
        emit(state.copyWith(stateStatus: AppStateStatus.noInternet, message: T.noInternetConnection.r));
        return false;
      }
    }
    return true;
  }

  // Resets the state to its initial values
  void reset() {
    emit(BaseBlocState<K>());
  }
}
