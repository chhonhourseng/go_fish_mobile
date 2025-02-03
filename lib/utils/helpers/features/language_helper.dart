import 'package:app/export.dart';

class LanguageHelper {
  static show(BuildContext context) {
    return AppBottomSheet(
      title: T.language.r,
      isAutoHeight: true,
      child:BlocProvider.value(
        value: BlocProvider.of<GetLanguageCubit>(context),
        child: const LanguageWidget(),
      ),
    ).show(context);
  }
}
