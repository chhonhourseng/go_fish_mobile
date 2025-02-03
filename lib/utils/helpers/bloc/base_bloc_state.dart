import 'package:app/export.dart';

class BaseBlocState<T> {
  final AppStateStatus stateStatus;
  final String? message;
  final bool isShowBarUnderMaintenance;
  final T? data;

  BaseBlocState({
    this.stateStatus = AppStateStatus.none,
    this.message,
    this.isShowBarUnderMaintenance = false,
    this.data,
  });

  BaseBlocState<T> copyWith({
    AppStateStatus? stateStatus,
    bool? isShowBarUnderMaintenance,
    String? message,
    T? data,
  }) {
    return BaseBlocState<T>(
      stateStatus: stateStatus ?? this.stateStatus,
      isShowBarUnderMaintenance: isShowBarUnderMaintenance ?? this.isShowBarUnderMaintenance,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}
