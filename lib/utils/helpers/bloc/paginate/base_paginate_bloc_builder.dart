import 'package:app/export.dart';

abstract mixin class BasePaginateBlocBuilder<T> {
// The method below is responsible for generating the widget for each item in the data table.
// It receives the index and data for the item and returns the corresponding widget.
  @required
  Widget paginateItemWidget(int index, T data);

// The method below is a helper method for generating a list of widgets using the paginateItemWidget method.
// It takes a list of data and generates a list of widgets by calling paginateItemWidget for each item.
  List<Widget> paginateItemBuilder(List<T> data) {
    return List.generate(
      data.length,
      (index) => paginateItemWidget(index, data[index]),
    );
  }

// This method is not currently implemented and returns null.
// It could potentially be used for mapping a map of data to widgets, but it is not used in the current implementation.
  Widget? mapPaginateItemBuilder(Map<String, T>? data) {
    return null;
  }

// This method generates the widget to be displayed when an error occurs and the data is null.
// It receives the bloc and state as parameters and returns an error widget with a title and a tap gesture for reloading.
  Widget errorWidget(BasePaginateBlocCubit<T> cubit, BasePaginateBlocState<T> state) {
    return AppErrorWidget(
      status: state.stateStatus,
      title: state.message,
      titleNoData: cubit.noDataErrorText,
      onTap: () {
        cubit.load();
      },
    );
  }

// This method generates the widget to be displayed when an error occurs and the data is not null.
// It receives the bloc, state, and an optional headWidget as parameters.
// The headWidget is a widget that appears at the top of the data table.
// The errorBottomWidget is displayed at the bottom of the data table item widget.
  Widget errorBottomWidget(
    BasePaginateBlocCubit<T> cubit,
    BasePaginateBlocState<T> state,
    Widget Function(BuildContext context)? headWidget,
  ) {
    return Container(
      margin: EdgeInsets.only(top: 10 + (cubit.isDataEmpty && cubit.isShowBarUnderMaintenance && headWidget == null ? 100 : 0)),
      child: AppErrorBottomWidget(
        status: state.stateStatus,
        message: state.message,
        onTap: () {
          cubit.reload();
        },
      ),
    );
  }

// This method generates the loading widget.
// It receives an optional parameter isHasHeadWidget, which indicates whether there is a headWidget present.
// If isHasHeadWidget is false, it returns a container with the AppLoadingWidget.
// If isHasHeadWidget is true, it returns a column with a SizedBox and the AppLoadingWidget.
  Widget loadingWidget([bool isHasHeadWidget = false]) {
    return !isHasHeadWidget
        ? Container(
            margin: const EdgeInsets.only(top: 15),
            child: loadingContainer(),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              loadingContainer(),
            ],
          );
  }

  Widget loadingContainer() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppLoadingWidget(),
      ],
    );
  }

// This method generates the main paginate builder widget.
// It receives various parameters for customization such as context, bloc, state, padding, etc.
  Widget buildPaginate(
    BuildContext context,
    BasePaginateBlocCubit<T> cubit,
    BasePaginateBlocState<T> state, {
    EdgeInsets? padding,
    bool hasRefreshIndicator = true,
    Widget Function(int index)? separator,
    Widget Function(BuildContext context)? headWidget,
    ScrollController? customController,
    GestureTapCallback? onRefresh,
    Axis scrollDirection = Axis.vertical,
    Widget? endWidget,
  }) {
    Widget build = AppNoInternetOverWidget(
      isShow: cubit.isShowBarError && cubit.isNetwork && cubit.isShowBarNoInternet,
      child: AppLoadingOverWidget(
        isShowLoading: cubit.isLoadingOver,
        child: Builder(builder: (context) {
          List<Widget> listWidget = [];

          if (headWidget != null) {
            listWidget.add(headWidget(context));
          }

          if (cubit.isLoading) {
            // Only return loadingWidget if there's no headWidget
            return loadingWidget(headWidget != null);
          }

          if (!cubit.isDataEmpty) {
            final mapWidget = mapPaginateItemBuilder(state.mapData);
            if (mapWidget == null || state.mapData == null) {
              var builder = paginateItemBuilder(state.data!);
              if (separator != null) {
                builder = builder.separator((index) => separator(index));
              } else {
                builder = builder.separator((index) => const SizedBox(height: 15));
              }

              listWidget.addAll(builder);
            } else {
              listWidget.add(mapWidget);
            }
          } else {
            if (headWidget == null) {
              return errorWidget(cubit, state);
            } else if (!cubit.isLoading) {
              listWidget.add(errorBottomWidget(cubit, state, headWidget));
            }
          }

          if (cubit.isErrorBottom) {
            listWidget.add(errorBottomWidget(cubit, state, headWidget));
          } else if (cubit.isLoadingBottom) {
            listWidget.add(
              Container(
                margin: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 30, top: 10),
                child: loadingContainer(),
              ),
            );
          }
          if (cubit.isEndText) {
            listWidget.add(
              endWidget ?? endBuilder(),
            );
          }
          listWidget.add(SizedBox(height: MediaQuery.of(context).padding.bottom + 15));
          return AppListViewBuilder(
            scrollDirection: scrollDirection,
            padding: padding,
            controller: customController ?? cubit.scrollController,
            children: listWidget,
          );
        }),
      ),
    );
    return hasRefreshIndicator
        ? RefreshIndicator(
            onRefresh: () async {
              cubit.load();
              onRefresh?.call();
            },
            child: build,
          )
        : build;
  }

  Widget endBuilder() {
    return Container();
  }
}
