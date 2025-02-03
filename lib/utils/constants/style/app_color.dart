import "package:flutter/material.dart";

class AppColor {
  // App colors collected from figma
  static const int primaryHex = 0xFFFF5B4F;
  static const primaryColor = Color(0xFFFF5B4F);
  static const blue = Color(0XFF44C1FF);
  static const green = Colors.green;

  static const primaryButtonColor = Color(primaryHex);

  static const blackColor = Color(0XFF000000);
  static const bgDarkColor = Color(0XFF2C2D2E);
  static const whiteColor = Color(0XFFFFFFFF);
  static const lightGreyColor = Color(0XFFDCDCDC);
  static const darkGreyColor = Color(0XFFAAAAAA);
  static const secondaryColor = Color(0XFFB1060F);
  static const infoColor = Color(0XFF007BE0);
  static const backgroundDarkMenuColor = Color(0XFF2C2D2E);
  static const starColor = Color(0XFFFFD646);
  static const grey6Color = Color(0XFFF2F2F2);
  static const timeGreyColor = Color(0xFFAEAEAE);
  static const orangeColor = Color(0xFFFF7E20);

  static const danger = Colors.red;
  static const dangerDark = Color(0xffC25452);
  static const success = Colors.green;
  static const success50 = Color(0xffE6FAF7);
  static const warning = Color(0xfff6b818);
  static const warningDark = Color(0XFFF6B818);
  static const info = Colors.blue;
  static const disable = Color(0xFFDCDCDC);

  static const Color greyDark = Color(0xFF4F4F4F);
  static const Color greyLight = Color(0xFF8A8A8A);
  static const Color greyLightI = Color(0xFFAAAAAA);
  static const Color greyLightII = Color(0xFFD9D9D9);
  static const Color greyLightTextfield = Color(0xFFEBEBEB);
  static const Color bgGreyLight = Color(0xFFF8F8F8);
  static const Color textGrey = Color(0xFF808080);

  static const Color bgSmokeGrey = Color(0xFFF7F7F7);

  //** Background
  static const scaffoldBackground = Colors.white;
  static const scaffoldGreyBackground = Color(0xFFFAFAFA);
  static const divider = Color(0xFFA6A6A6);
  static const containerBackgroundBlack = Colors.white;
  static const Color primaryLight = Color(0xFFFFC18A);

  //** Gradient
  static LinearGradient gradientPrimary() => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0XFF47BA40).withOpacity(.13),
          const Color(0XFF47BA40).withOpacity(.1),
          const Color(0XFF47BA40).withOpacity(.1),
          const Color(0XFFBBBBBB).withOpacity(.05),
        ],
      );

  static const bottomNavigationColor = LinearGradient(
    colors: [Color(0xff1057C5), Color(0xff0D49A7)],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  static const icon = Color(0xFF55BCBE);

  static const MaterialColor kToBlack = MaterialColor(
    0xff000000, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff000000), //10%
      100: Color(0xff000000), //20%
      200: Color(0xff000000), //30%
      300: Color(0xff000000), //40%
      400: Color(0xff000000), //50%
      500: Color(0xff000000), //60%
      600: Color(0xff000000), //70%
      700: Color(0xff000000), //80%
      800: Color(0xff000000), //90%
      900: Color(0xff000000), //100%
    },
  );

  static const MaterialColor kToLight = MaterialColor(
    AppColor.primaryHex,
    // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: AppColor.primaryColor, //10%
      100: AppColor.primaryColor, //20%
      200: AppColor.primaryColor, //30%
      300: AppColor.primaryColor, //40%
      400: AppColor.primaryColor, //50%
      500: AppColor.primaryColor, //60%
      600: AppColor.primaryColor, //70%
      700: AppColor.primaryColor, //80%
      800: AppColor.primaryColor, //90%
      900: AppColor.primaryColor, //100%
    },
  );
}
