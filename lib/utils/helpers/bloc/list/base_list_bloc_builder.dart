import 'package:app/export.dart';

abstract mixin class BaseListBlocBuilder<T> {
// Returns a widget that represents an item in the list
  @required
  Widget listItemWidget(int index, T data);

// Requests data for the list
  @required
  void request();

// Builds a list of widgets from the data list
  List<Widget> buildListItems(List<T> data, double marginTop) {
    return List.generate(
      data.length,
      (index) => Container(
        margin: EdgeInsets.only(top: index == 0 ? marginTop : 0),
        child: listItemWidget(index, data[index]),
      ),
    );
  }

// Returns a widget to display when loading data
  Widget loadingWidget() {
    return Container(
      margin: 15.pt(),
      child: Column(
        children: [
          loadingContainer(),
        ],
      ),
    );
  }

// Returns a widget to display when there is an error
  Widget errorWidget(BaseListBlocCubit<T> cubit, BaseListBlocState<T> state) {
    return AppErrorWidget(
      status: state.stateStatus,
      titleNoData: cubit.noDataErrorText,
      title: state.message,
      onTap: () {
        request();
      },
    );
  }

// Returns a widget to display at the bottom when there is an error
  Widget errorBottomWidget(BaseListBlocCubit<T> cubit, BaseListBlocState<T> state) {
    return AppErrorBottomWidget(
      status: state.stateStatus,
      message: state.message,
      onTap: () {
        request();
      },
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

// Builds the list widget with various options
  Widget buildList(
    BuildContext context,
    BaseListBlocCubit<T> cubit,
    BaseListBlocState<T> state, {
    double marginTop = 0.0,
    bool hasRefreshIndicator = true,
    EdgeInsets? padding,
    Widget Function(int index)? separator,
    ScrollPhysics? physics,
  }) {
    final build = AppNoInternetOverWidget(
      isShow: cubit.isShowBarError && cubit.isShowBarNoInternet,
      child: AppLoadingOverWidget(
        isShowLoading: cubit.isLoadingOver,
        child: Builder(builder: (context) {
          if (cubit.isLoading) {
            return loadingWidget();
          }
          List<Widget> listWidget = [];
          if (!cubit.isDataEmpty) {
            final builder = buildListItems(state.data!, marginTop).separator(separator ?? (i) => 15.sh());
            listWidget.addAll(builder);
          } else {
            return errorWidget(cubit, state);
          }
          listWidget.add(SizedBox(height: MediaQuery.of(context).padding.bottom + 15));
          return AppListViewBuilder(
            padding: padding,
            physics: physics,
            children: listWidget,
          );
        }),
      ),
    );
    return hasRefreshIndicator
        ? RefreshIndicator(
            onRefresh: () async {
              request();
            },
            child: build,
          )
        : build;
  }

// Builds a widget with various options
  Widget buildWidget(
    BuildContext context,
    BaseListBlocCubit<T> cubit,
    BaseListBlocState<T> state, {
    required Widget Function(BuildContext context, List<T> data) builder,
    bool isPage = true,
    bool isWithScaffold = false,
  }) {
    final _builder = Builder(builder: (context) {
      if (cubit.isLoading) {
        // If loading, show either the loading widget as a full page or within a column.
        return isPage
            ? loadingWidget()
            : Column(
                children: [
                  const SizedBox(height: 15),
                  loadingContainer(),
                ],
              );
      }

      if (!cubit.isDataEmpty) {
        // If data is not empty, use the builder to display the data.
        return builder(context, state.data!);
      }

      // When data is empty, handle it based on whether it is a page or not.
      if (isPage) {
        // Show the error widget if it's a full page.
        return errorWidget(cubit, state);
      }

      // For non-page cases, show a column with optional maintenance bar and error bottom widget.
      return Column(
        children: [
          const SizedBox(height: 7),
          if (cubit.isShowBarUnderMaintenance) const SizedBox(height: 100),
          errorBottomWidget(cubit, state),
        ],
      );
    });
    return isWithScaffold && !cubit.isSuccess
        ? Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              leading: const BackArrowWidget(),
            ),
            body: _builder,
          )
        : _builder;
  }
}
