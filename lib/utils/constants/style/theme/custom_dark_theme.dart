import 'package:app/export.dart';

const _defaultFontHeight = 1.35;
const _fontColor = Colors.white;
const _fontFamily = "Inter";

final ThemeData customDarkTheme = ThemeData(
  primarySwatch: AppColor.kToLight,
  brightness: Brightness.dark,
  primaryColor: AppColor.primaryColor,
  primaryColorLight: const Color(0xffc8e6c9),
  primaryColorDark: const Color(0xff388e3c),
  canvasColor: Colors.white,
  cardTheme: _cardTheme,
  filledButtonTheme: _filledButtonThemeData,
  textButtonTheme: _textButton,
  outlinedButtonTheme: _outLineButtonTheme,
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.grey[600]!,
    suffixStyle: const TextStyle(
      fontSize: 12,
      color: _fontColor,
    ),
    labelStyle: const TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    hintStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    prefixIconColor: _fontColor,
    suffixIconColor: _fontColor,
    focusColor: AppColor.greyLightI,
    border: const OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF828282), width: 1.5),
      gapPadding: 0,
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF828282), width: 1),
      gapPadding: 0,
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF828282), width: 1.5),
      gapPadding: 0,
    ),
    constraints: const BoxConstraints(
      minHeight: 20,
    ),
  ),
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
    brightness: Brightness.dark,
  ),

  /// Scaffold backgroundColor
  scaffoldBackgroundColor: AppColor.bgDarkColor,
  cardColor: const Color(0xFFF5F5F5),
  dividerColor: AppColor.blackColor.withOpacity(.7),
  highlightColor: const Color(0xFF0C0E0E),
  splashColor: const Color(0x66c8c8c8),
  unselectedWidgetColor: Colors.black,
  disabledColor: const Color(0x61000000),
  secondaryHeaderColor: const Color(0xffe8f5e9),
  dialogBackgroundColor: Colors.grey[900],
  indicatorColor: AppColor.primaryColor,
  hintColor: AppColor.blackColor,
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Colors.white,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColor.backgroundDarkMenuColor,
    elevation: 0,
    type: BottomNavigationBarType.fixed,
    unselectedLabelStyle: TextStyle(
      color: AppColor.darkGreyColor,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    selectedLabelStyle: TextStyle(
      color: AppColor.whiteColor,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    unselectedItemColor: AppColor.darkGreyColor,
    selectedItemColor: AppColor.whiteColor,
  ),
  appBarTheme: const AppBarTheme(
    /// AppBar backgroundColor
    backgroundColor: AppColor.bgDarkColor,
    centerTitle: true,
    elevation: .5,
    shadowColor: Color(0xFF0C0E0E),
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.transparent,
    titleTextStyle: TextStyle(
      color: _fontColor,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontFamily: _fontFamily,
    ),
    iconTheme: IconThemeData(
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
  tabBarTheme: const TabBarTheme(
    indicatorSize: TabBarIndicatorSize.label,
    labelColor: _fontColor,
    unselectedLabelColor: Color(0xFFC4C4C4),
    labelPadding: EdgeInsets.symmetric(horizontal: 14),
    unselectedLabelStyle: TextStyle(
      fontSize: 14,
    ),
    labelStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
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
      foregroundColor: AppColor.primaryColor,
      disabledForegroundColor: AppColor.darkGreyColor,
      minimumSize: const Size(30, 44),
      side: const BorderSide(width: 1, color: AppColor.primaryColor),
      textStyle: const TextStyle(
        fontFamily: _fontFamily,
        color: AppColor.primaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
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
        borderRadius: BorderRadius.circular(8.0),
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
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: const TextStyle(
        fontFamily: _fontFamily,
        color: AppColor.whiteColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

CardTheme get _cardTheme {
  return CardTheme(
    color: Colors.black,
    margin: EdgeInsets.zero,
    elevation: 15,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    shadowColor: Colors.black.withOpacity(0.4),
    surfaceTintColor: AppColor.whiteColor,
  );
}
