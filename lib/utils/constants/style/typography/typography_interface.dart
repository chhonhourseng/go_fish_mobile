import 'package:app/export.dart';

abstract class TypographyInterface {
  final String fontFamily = "Inter";
  final double fontHeight = 1.35;

  Color get fontColor;

  /// headline :::::::::::::::::::::::::::::::::::::
  TextStyle get headline1 => TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
        height: fontHeight,
        color: fontColor,
      );

  TextStyle get headline2 => headline1.copyWith(
        fontSize: 40,
      );

  TextStyle get headline3 => headline1.copyWith(
        fontSize: 32,
      );

  TextStyle get headline4 => headline1.copyWith(
        fontSize: 28,
      );

  TextStyle get headline5 => headline1.copyWith(
        fontSize: 24,
      );

  /// subtitle :::::::::::::::::::::::::::::::::::::
  TextStyle get subtitle1 => headline1.copyWith(
        fontSize: 18,
      );

  TextStyle get subtitle2 => headline1.copyWith(
        fontSize: 16,
      );

  /// body :::::::::::::::::::::::::::::::::::::
  TextStyle get body1 => headline1.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );

  TextStyle get body2 => body1.copyWith(
        fontWeight: FontWeight.w500,
      );

  TextStyle get body3 => headline1.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );

  TextStyle get body4 => headline1.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );

  TextStyle get body5 => headline1.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      );

  TextStyle get body6 => headline1.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      );

  /// caption :::::::::::::::::::::::::::::::::::::
  TextStyle get caption1 => body3.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 12,
      );

  TextStyle get caption2 => caption1.copyWith(
        fontWeight: FontWeight.w500,
      );

  TextStyle get caption3 => caption2.copyWith(
        fontSize: 10,
      );

  TextStyle get caption4 => caption3.copyWith(
        fontWeight: FontWeight.w500,
      );

  TextStyle get caption5 => caption3.copyWith(
        fontSize: 10,
      );

  /// label :::::::::::::::::::::::::::::::::::::
  TextStyle get label => body3.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      );

  /// button :::::::::::::::::::::::::::::::::::::
  TextStyle get giant => headline1.copyWith(
        fontSize: 18,
      );

  TextStyle get large => headline1.copyWith(
        fontSize: 16,
      );

  TextStyle get medium => headline1.copyWith(
        fontSize: 14,
      );

  TextStyle get small => headline1.copyWith(
        fontSize: 12,
      );

  TextStyle get tiny => headline1.copyWith(
        fontSize: 10,
      );
}
