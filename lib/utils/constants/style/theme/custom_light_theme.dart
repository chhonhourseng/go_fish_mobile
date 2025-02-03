import 'package:app/export.dart';

const _defaultFontHeight = 1.35;
const _fontColor = Colors.black;
const _fontFamily = "Inter"; //"Inter";
final TypographyLight typography = TypographyLight();

final ThemeData customLightTheme = ThemeData(
  useMaterial3: false,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primarySwatch: AppColor.kToLight,
  brightness: Brightness.light,
  primaryColor: AppColor.primaryColor,
  primaryColorLight: const Color(0xffc8e6c9),
  primaryColorDark: const Color(0xff388e3c),
  canvasColor: Colors.white,
  cardTheme: _cardTheme,
  filledButtonTheme: _filledButtonThemeData,
  textButtonTheme: _textButton,
  outlinedButtonTheme: _outLineButtonTheme,
  inputDecorationTheme: _inputDecoration,
  colorScheme: const ColorScheme(
    primary: Colors.red,
    secondary: Colors.white,
    surface: Color(0xffffffff),
    background: AppColor.whiteColor,
    error: Color(0xffd32f2f),
    onPrimary: Color(0xffffffff),
    onSecondary: Color(0xffffffff),
    onSurface: Color(0xff000000),
    onBackground: Color(0xffffffff),
    onError: Colors.red,
    brightness: Brightness.light,
  ),

  /// Scaffold backgroundColor
  scaffoldBackgroundColor: AppColor.scaffoldGreyBackground,
  cardColor: const Color(0xFFF5F5F5),
  dividerColor: AppColor.greyLightII,
  highlightColor: const Color(0x66bcbcbc),
  splashColor: const Color(0x66c8c8c8),
  unselectedWidgetColor: Colors.black,
  disabledColor: const Color(0x61000000),
  secondaryHeaderColor: const Color(0xffe8f5e9),
  dialogBackgroundColor: AppColor.whiteColor,
  indicatorColor: AppColor.primaryColor,
  hintColor: AppColor.blackColor,
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Colors.white,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFFAFAFA),
    elevation: 0,
    type: BottomNavigationBarType.fixed,
    unselectedLabelStyle: TextStyle(
      color: Color(0xFFAAAAAA),
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    selectedLabelStyle: TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    unselectedItemColor: AppColor.darkGreyColor,
    selectedItemColor: Colors.black,
  ),
  appBarTheme: AppBarTheme(
    /// AppBar backgroundColor
    backgroundColor: AppColor.whiteColor,
    centerTitle: true,
    elevation: 0.0,
    shadowColor: const Color(0xFFDCDCDC),
    scrolledUnderElevation: 0.2,
    surfaceTintColor: Colors.transparent,
    titleTextStyle: typography.subtitle1,
    iconTheme: const IconThemeData(
      color: _fontColor,
      size: 24,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
    minWidth: 88,
    height: 47,
    padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: Color(0xff000000),
        width: 0,
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
    alignedDropdown: false,
    buttonColor: Color(0xffe0e0e0),
    disabledColor: Color(0x61000000),
    highlightColor: Color(0x29000000),
    splashColor: Color(0x1f000000),
    focusColor: Color(0x1f000000),
    hoverColor: Color(0x0a000000),
    colorScheme: ColorScheme(
      primary: Colors.red,
      secondary: Colors.white,
      surface: Color(0xffffffff),
      background: AppColor.primaryColor,
      error: Color(0xffd32f2f),
      onPrimary: Color(0xffffffff),
      onSecondary: Color(0xffffffff),
      onSurface: Color(0xff000000),
      onBackground: Color(0xffffffff),
      onError: Colors.red,
      brightness: Brightness.light,
    ),
  ),
  fontFamily: _fontFamily,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: _fontColor,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      height: _defaultFontHeight,
    ),
    displayMedium: TextStyle(
      color: _fontColor,
      fontSize: 19,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      height: _defaultFontHeight,
    ),
    displaySmall: TextStyle(
      color: _fontColor,
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: _defaultFontHeight,
    ),
    headlineLarge: TextStyle(
      color: _fontColor,
      fontSize: 17,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      height: _defaultFontHeight,
    ),
    headlineMedium: TextStyle(
      color: _fontColor,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      height: _defaultFontHeight,
    ),
    headlineSmall: TextStyle(
      color: _fontColor,
      fontSize: 15,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      height: _defaultFontHeight,
    ),
    titleLarge: TextStyle(
      color: _fontColor,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: _defaultFontHeight,
    ),
    titleMedium: TextStyle(
      color: _fontColor,
      fontSize: 19,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: _defaultFontHeight,
    ),
    titleSmall: TextStyle(
      color: _fontColor,
      fontSize: 18,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: _defaultFontHeight,
    ),
    bodyLarge: TextStyle(
      color: _fontColor,
      fontSize: 17,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: _defaultFontHeight,
    ),
    bodyMedium: TextStyle(
      color: _fontColor,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: _defaultFontHeight,
    ),
    bodySmall: TextStyle(
      color: _fontColor,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: _defaultFontHeight,
    ),
    labelLarge: TextStyle(
      color: _fontColor,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: _defaultFontHeight,
    ),
    labelMedium: TextStyle(
      color: _fontColor,
      fontSize: 13,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: _defaultFontHeight,
    ),
    labelSmall: TextStyle(
      color: _fontColor,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.5,
      height: _defaultFontHeight,
    ),
  ),
  primaryTextTheme: const TextTheme(
    displayLarge: TextStyle(
      color: _fontColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      height: _defaultFontHeight,
    ),
    displayMedium: TextStyle(
      color: _fontColor,
      fontSize: 17,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      height: _defaultFontHeight,
    ),
    displaySmall: TextStyle(
      color: _fontColor,
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      height: _defaultFontHeight,
    ),
    headlineLarge: TextStyle(
      color: _fontColor,
      fontSize: 15,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      height: _defaultFontHeight,
    ),
    headlineMedium: TextStyle(
      color: _fontColor,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      height: _defaultFontHeight,
    ),
    headlineSmall: TextStyle(
      color: _fontColor,
      fontSize: 13,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      height: _defaultFontHeight,
    ),
    titleLarge: TextStyle(
      color: _fontColor,
      fontSize: 17,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: _defaultFontHeight,
    ),
    titleMedium: TextStyle(
      color: _fontColor,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: _defaultFontHeight,
    ),
    titleSmall: TextStyle(
      color: _fontColor,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: _defaultFontHeight,
    ),
    bodyLarge: TextStyle(
      color: _fontColor,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: _defaultFontHeight,
    ),
    bodyMedium: TextStyle(
      color: _fontColor,
      fontSize: 13,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: _defaultFontHeight,
    ),
    bodySmall: TextStyle(
      color: _fontColor,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: _defaultFontHeight,
    ),
    labelLarge: TextStyle(
      color: _fontColor,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: _defaultFontHeight,
    ),
    labelMedium: TextStyle(
      color: _fontColor,
      fontSize: 11,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: _defaultFontHeight,
    ),
    labelSmall: TextStyle(
      color: _fontColor,
      fontSize: 10,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: _defaultFontHeight,
    ),
  ),
  iconTheme: const IconThemeData(
    color: _fontColor,
    opacity: 1,
    size: 24,
  ),
  primaryIconTheme: const IconThemeData(
    color: _fontColor,
    opacity: 1,
    size: 24,
  ),
  sliderTheme: const SliderThemeData(
    activeTrackColor: null,
    inactiveTrackColor: null,
    disabledActiveTrackColor: null,
    disabledInactiveTrackColor: null,
    activeTickMarkColor: null,
    inactiveTickMarkColor: null,
    disabledActiveTickMarkColor: null,
    disabledInactiveTickMarkColor: null,
    thumbColor: null,
    disabledThumbColor: null,
    thumbShape: null,
    overlayColor: null,
    valueIndicatorColor: Colors.black,
    valueIndicatorShape: null,
    showValueIndicator: null,
    valueIndicatorTextStyle: TextStyle(
      color: Color(0xffffffff),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  ),
  tabBarTheme: TabBarTheme(
    indicatorSize: TabBarIndicatorSize.label,
    labelColor: _fontColor,
    unselectedLabelColor: const Color(0xFFC4C4C4),
    labelPadding: const EdgeInsets.symmetric(horizontal: 14),
    unselectedLabelStyle: TextStyle(
      fontSize: 14,
      color: Colors.black.withOpacity(0.7),
      fontFamily: _fontFamily,
    ),
    labelStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      fontFamily: _fontFamily,
    ),
  ),
  chipTheme: const ChipThemeData(
    backgroundColor: Color(0x1f000000),
    brightness: Brightness.light,
    deleteIconColor: Color(0xde000000),
    disabledColor: Color(0x0c000000),
    labelPadding: EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 8),
    labelStyle: TextStyle(
      color: Color(0xde000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
    secondaryLabelStyle: TextStyle(
      color: Color(0x3d000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    secondarySelectedColor: Color(0x3d4caf50),
    selectedColor: Color(0x3d000000),
    shape: StadiumBorder(
      side: BorderSide(
        color: Color(0xff000000),
        width: 0,
        style: BorderStyle.none,
      ),
    ),
  ),
  dialogTheme: const DialogTheme(
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: Color(0xff000000),
        width: 0,
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.all(Radius.circular(0.0)),
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Color(0xff4285f4),
    selectionColor: Color(0xff658ed3),
    selectionHandleColor: Color(0xff658ed3),
  ),
);

OutlinedButtonThemeData get _outLineButtonTheme {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      surfaceTintColor: AppColor.primaryColor,
      foregroundColor: AppColor.blackColor,
      disabledForegroundColor: AppColor.darkGreyColor,
      minimumSize: const Size(30, 44),
      side: const BorderSide(width: 1, color: AppColor.greyLightII),
      textStyle: const TextStyle(
        fontFamily: _fontFamily,
        color: AppColor.blackColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      shape: RoundedRectangleBorder(
        borderRadius: 4.r(),
      ),
    ),
  );
}

TextButtonThemeData get _textButton {
  return TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColor.primaryColor,
      minimumSize: const Size(30, 40),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: _fontFamily,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: 4.r(),
      ),
    ),
  );
}

FilledButtonThemeData get _filledButtonThemeData {
  return FilledButtonThemeData(
    style: FilledButton.styleFrom(
      minimumSize: const Size(30, 44),
      disabledBackgroundColor: const Color(0xffaeaeae),
      disabledForegroundColor: Colors.white,
      backgroundColor: AppColor.primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: 4.r(),
      ),
      textStyle: const TextStyle(
        fontFamily: _fontFamily,
        color: AppColor.whiteColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      /* backgroundBuilder: (BuildContext context, Set<MaterialState> states, Widget? child) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: 4.r(),
            gradient: const LinearGradient(
              colors: [
                Color(0XFFFFE34F),
                Color(0XFFFF5B4F),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: child,
        );
      },*/
    ),
  );
}

InputDecorationTheme get _inputDecoration {
  const borderRadius = BorderRadius.all(Radius.circular(8.0));
  return InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
    focusColor: AppColor.blue,
    // iconColor: AppColors.primary,
    // suffixIconColor: AppColors.primary,
    // floatingLabelBehavior: FloatingLabelBehavior.always,
    floatingLabelStyle: typography.body1,
    hintStyle: const TextStyle(
      fontSize: 15,
      color: AppColor.greyLight,
      fontFamily: _fontFamily,
    ),

    labelStyle: const TextStyle(
      fontSize: 15,
      color: AppColor.greyLight,
      fontFamily: _fontFamily,
    ),
    border: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColor.disable),
      borderRadius: borderRadius,
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColor.disable),
      borderRadius: borderRadius,
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColor.blue, width: 1.0),
      borderRadius: borderRadius,
    ),
    errorMaxLines: 2,
    errorStyle: const TextStyle(fontSize: 12, color: AppColor.danger),
    disabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColor.disable),
      borderRadius: borderRadius,
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColor.danger, width: 1.2),
      borderRadius: borderRadius,
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColor.danger, width: 1.0),
      borderRadius: borderRadius,
    ),
  );
}

CardTheme get _cardTheme {
  return CardTheme(
    color: Colors.white,
    margin: EdgeInsets.zero,
    elevation: 0.0,
    shape: RoundedRectangleBorder(
      borderRadius: 12.r(),
    ),
    shadowColor: AppColor.whiteColor,
    surfaceTintColor: AppColor.whiteColor,
  );
}
