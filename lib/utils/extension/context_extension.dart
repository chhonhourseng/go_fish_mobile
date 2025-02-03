import 'package:app/export.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  TypographyInterface get typography => this.isDark ? TypographyDark() : TypographyLight();

  NavigationHelper get navigate => NavigationHelper(this);

  TextStyle? get buttonTextStyle => textTheme.bodyMedium?.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w700,
      );

  DialogTheme get dialogTheme => theme.dialogTheme;

  Color get dialogBackgroundColor => theme.dialogBackgroundColor;

  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;

  TextStyle? get appBarTextTheme => theme.appBarTheme.titleTextStyle;

  InputDecorationTheme get inputDecoration => theme.inputDecorationTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  bool get isDark {
    return Theme.of(this).brightness == Brightness.dark;
  }

  Color get dividerColor => theme.dividerColor;

  Color get highlightColor => theme.highlightColor;

  Color get iconColor => isDark ? Colors.white : Colors.black;

  ButtonStyle? get filledButtonTheme => theme.filledButtonTheme.style;

  ButtonStyle? get textButtonTheme => theme.textButtonTheme.style;

  ButtonStyle? get outlinedButtonTheme => theme.outlinedButtonTheme.style;
}
