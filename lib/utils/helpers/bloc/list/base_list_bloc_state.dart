import 'package:app/export.dart';

class BaseListBlocState<T> {
  final AppStateStatus stateStatus;
  final String? message;
  final List<T>? data;
  final bool isShowBarNoInternet;
  final bool isShowBarUnderMaintenance;

  BaseListBlocState({
    this.stateStatus = AppStateStatus.none,
    this.message,
    this.data,
    this.isShowBarNoInternet = false,
    this.isShowBarUnderMaintenance = false,
  });

  BaseListBlocState<T> copyWith({
    bool? nextUrl,
    AppStateStatus? stateStatus,
    String? message,
    List<T>? data,
    bool? isShowBarNoInternet,
    bool? isShowBarUnderMaintenance,
  }) {
    return BaseListBlocState<T>(
      stateStatus: stateStatus ?? this.stateStatus,
      message: message ?? this.message,
      data: data ?? this.data,
      isShowBarNoInternet: isShowBarNoInternet ?? this.isShowBarNoInternet,
      isShowBarUnderMaintenance: isShowBarUnderMaintenance ?? this.isShowBarUnderMaintenance,
    );
  }
}
