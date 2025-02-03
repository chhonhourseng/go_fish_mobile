import 'package:app/export.dart';

class BaseSocketState {
  BaseSocketState({
    this.stateStatus = AppStateStatus.none,
    this.message,
    this.eventData,
  });

  final AppStateStatus stateStatus;
  final String? message;
  final Map<String, BaseSocketEventState>? eventData;

  BaseSocketState copyWith({
    AppStateStatus? stateStatus,
    String? message,
    Map<String, BaseSocketEventState>? eventData,
  }) {
    return BaseSocketState(
      stateStatus: stateStatus ?? this.stateStatus,
      message: message ?? this.message,
      eventData: eventData ?? this.eventData,
    );
  }
}

class BaseSocketEventState<K> {
  BaseSocketEventState({
    required this.event,
    this.stateStatus = AppStateStatus.none,
    this.message,
    this.data,
  });

  final String event;
  final AppStateStatus stateStatus;
  final String? message;
  final BaseResponse<K>? data;

  BaseSocketEventState<K> copyWith({
    AppStateStatus? stateStatus,
    String? message,
    BaseResponse<K>? data,
  }) {
    return BaseSocketEventState<K>(
      event: this.event,
      stateStatus: stateStatus ?? this.stateStatus,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}
