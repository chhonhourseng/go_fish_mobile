import 'dart:async';
import 'package:app/export.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

abstract class BaseSocketCubit extends Cubit<BaseSocketState> {
  BaseSocketCubit(this.socket) : super(BaseSocketState());
  final SocketInterface socket;

  final Connectivity _connectivity = AppConnectivity.instance;

  // Returns true if the stateStatus indicates loading
  bool get isLoading =>
      state.stateStatus == AppStateStatus.loading || state.stateStatus == AppStateStatus.initial || state.stateStatus == AppStateStatus.none;

  // Returns true if the stateStatus indicates an error
  bool get isError => state.stateStatus == AppStateStatus.failure || state.stateStatus == AppStateStatus.noInternet;

  // Returns true if the stateStatus indicates success
  bool get isSuccess => state.stateStatus == AppStateStatus.success;

  bool isInitialized = false;

  //
  Future init({void Function()? onSuccess}) async {
    // If the stateStatus indicates loading is true, return
    if (state.stateStatus == AppStateStatus.loading) {
      return;
    }

    // Set the stateStatus to loading
    emit(state.copyWith(stateStatus: AppStateStatus.loading));

    // Check connectivity
    final _checkConnectivity = await checkConnectivity();
    if (!_checkConnectivity) {
      return;
    }

    try {
      socket.initSocketConnection(
        onError: (v) => emit(
          state.copyWith(
            stateStatus: AppStateStatus.disConnected,
            message: v.toString(),
          ),
        ),
        onSuccess: (v) {
          if (!isInitialized) {
            onSuccess?.call();
          }
          isInitialized = true;
          emit(
            state.copyWith(stateStatus: AppStateStatus.connected),
          );
        },
      );
    } catch (e) {
      if (kDebugMode) {
        // Handle error in debug mode
      }
      // Set the stateStatus to failure and update the message with the error
      emit(state.copyWith(
        stateStatus: AppStateStatus.disConnected,
        message: e.toString(),
      ));
    }
  }

  void onEmit<L>(
    String event, {
    ValueChanged<BaseResponse<L>>? onEmit,
  }) {
    _onEmit(event, onEmit: onEmit);
  }

  void onEmitWithAck<L>(
    String event, {
    dynamic data,
    ValueChanged<BaseResponse<L>>? onEmit,
  }) {
    _onEmit(event, data: data, withAck: true, onEmit: onEmit);
  }

  void _onEmit<L>(
    String event, {
    dynamic data,
    bool withAck = false,
    ValueChanged<BaseResponse<L>>? onEmit,
  }) {
    if (kDebugMode) {}
    var eventData = state.eventData ?? {};
    if (eventData.containsKey(event)) {
      eventData[event] = eventData[event]!.copyWith(stateStatus: AppStateStatus.loading);
    } else {
      eventData[event] = BaseSocketEventState<L>(event: event, stateStatus: AppStateStatus.loading);
    }
    if (kDebugMode) {}
    emit(state.copyWith(eventData: eventData));
    try {
      if (!withAck) {
        socket.instant?.onEmit<L>(event, onChange: (v) {
          _emitData(event, data: v);
          onEmit?.call(v);
        });
      } else {
        socket.instant?.onEmitWithAck<L>(event, data: data, onChange: (v) {
          _emitData(event, data: v);
          onEmit?.call(v);
        });
      }
    } catch (e) {
      if (kDebugMode) {}
      eventData[event] = eventData[event]!.copyWith(
        stateStatus: AppStateStatus.failure,
      );
      emit(state.copyWith(eventData: eventData));
    }
  }

  void _emitData<L>(String event, {required BaseResponse<L> data}) {
    var eventData = state.eventData ?? {};
    eventData[event] = eventData[event]!.copyWith(
      data: data,
      stateStatus: AppStateStatus.success,
    );
    emit(state.copyWith(eventData: eventData));
    if (kDebugMode) {}
  }

  BaseSocketEventState<L>? getEvent<L>(String event) {
    var eventData = state.eventData ?? {};
    if (eventData.containsKey(event)) {
      try {
        return eventData[event] as BaseSocketEventState<L>;
      } catch (_) {
        return eventData[event] as dynamic;
      }
    }
    return null;
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

  @override
  Future<void> close() {
    socket.close();
    return super.close();
  }

  // Resets the state to its initial values
  void reset() {
    emit(BaseSocketState());
  }
}
