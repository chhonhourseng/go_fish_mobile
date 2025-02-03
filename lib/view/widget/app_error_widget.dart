import 'package:app/export.dart';

class AppErrorWidget extends StatelessWidget {
  final AppStateStatus status;
  final GestureTapCallback? onTap;
  final String? title;
  final String? titleNoData;
  final bool isSearch;
  final bool isShowButtonNoData;
  final bool isShowButtonError;

  const AppErrorWidget({
    super.key,
    required this.status,
    this.onTap,
    this.title,
    this.isSearch = false,
    this.isShowButtonNoData = false,
    this.isShowButtonError = false,
    this.titleNoData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: app.screenPadding,
      child: status == AppStateStatus.noInternet
          ? NoInternetView(
              onTap: onTap,
            )
          : (status == AppStateStatus.empty
              ? NoDataView(
                  isSearch: isSearch,
                  onTap: onTap,
                  title: titleNoData,
                  isShowButton: isShowButtonNoData,
                )
              : ErrorViewWidget(
                  title: title,
                  onTap: onTap,
                  isShowButton: isShowButtonError,
                )),
    );
  }
}
