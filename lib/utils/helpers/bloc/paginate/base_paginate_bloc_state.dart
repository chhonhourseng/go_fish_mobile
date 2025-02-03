import 'package:app/export.dart';

class BasePaginateBlocState<T> {
  final bool hasNextPage;
  final bool isShowBarNoInternet;
  final bool isShowBarUnderMaintenance;
  final AppStateStatus stateStatus;
  final String? message;
  final List<T>? data;
  final Map<String, T>? mapData;

  BasePaginateBlocState({
    this.hasNextPage = false,
    this.isShowBarNoInternet = false,
    this.isShowBarUnderMaintenance = false,
    this.stateStatus = AppStateStatus.none,
    this.message,
    this.data,
    this.mapData,
  });

  BasePaginateBlocState<T> copyWith({
    bool? hasNextPage,
    bool? isShowBarNoInternet,
    bool? isShowBarUnderMaintenance,
    AppStateStatus? stateStatus,
    String? message,
    List<T>? data,
    Map<String, T>? mapData,
  }) {
    return BasePaginateBlocState<T>(
      hasNextPage: hasNextPage ?? this.hasNextPage,
      isShowBarNoInternet: isShowBarNoInternet ?? this.isShowBarNoInternet,
      isShowBarUnderMaintenance: isShowBarUnderMaintenance ?? this.isShowBarUnderMaintenance,
      stateStatus: stateStatus ?? this.stateStatus,
      message: message ?? this.message,
      data: data ?? this.data,
      mapData: mapData ?? this.mapData,
    );
  }
}
