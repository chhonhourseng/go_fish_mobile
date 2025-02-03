import 'dart:io';

import 'package:app/export.dart';

class ContextHelper {
  static late BuildContext _appContext;
  static late BuildContext _dashboardContext;
  static late EdgeInsets _padding;
  static late Size _size;

  ContextHelper.initialize({required BuildContext context}) {
    _appContext = context;
    _padding = context.mediaQuery.padding;
    _size = context.mediaQuery.size;
  }

  static void initHomeContext(BuildContext context) {
    _dashboardContext = context;
  }

  static BuildContext get instance => _appContext;

  static BuildContext get dashbaordContext => _dashboardContext;

  static EdgeInsets get padding => _padding;

  static Size get size => _size;

  static double bottom = Platform.isIOS ? (ContextHelper.padding.bottom * 0.8) : (ContextHelper.padding.bottom + 10);

}
