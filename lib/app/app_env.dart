import 'package:app/export.dart';

class AppEnv {
  /// Production Environment
  static const Map<String, dynamic> productionEnvironment = {
    BASE_URL: "",
    CHAT_BASE_URL: '',
    CHAT_APP_KEY: '',
    DEEP_LINK: '',
    COPY_LINK: '',
  };

  /// Development Environment
  static const Map<String, dynamic> developmentEnvironment = {
    BASE_URL: "http://192.168.0.04:4000", //"http://192.168.0.4:4000",
    //BASE_URL: "http://192.168.0.64:4000",
    // CHAT_BASE_URL: 'http://192.168.0.238:3000',
    CHAT_BASE_URL: 'https://chat-sdk.vai247.pro',
    CHAT_APP_KEY: '299314d214fc4a9da94318bbb3022ecc',
    DEEP_LINK: '',
    COPY_LINK: '',
  };

  /// Staging Environment
  static const Map<String, dynamic> stagingEnvironment = {
    BASE_URL: "",
    CHAT_BASE_URL: '',
    CHAT_APP_KEY: '',
    DEEP_LINK: '',
    COPY_LINK: '',
  };

  static String baseUrl = FlavorConfig.instance!.variables[BASE_URL];
  static String deepLink = FlavorConfig.instance!.variables[DEEP_LINK];
  static String copyLink = FlavorConfig.instance!.variables[COPY_LINK];
  static String chatBaseUrl = FlavorConfig.instance!.variables[CHAT_BASE_URL];
  static String chatAppKey = FlavorConfig.instance!.variables[CHAT_APP_KEY];

  /// Three type of environment
  static const String PRODUCTION_LABEL_NAME = "Production";
  static const String DEVELOPMENT_LABEL_NAME = "Dev";
  static const String STAGING_LABEL_NAME = "Staging";

  /// Key variable
  static const String BASE_URL = "baseUrl";
  static const String DEEP_LINK = "deepLink";
  static const String COPY_LINK = "copyLink";
  static const String CHAT_BASE_URL = "chatBaseUrl";
  static const String CHAT_APP_KEY = "chatAppKey";
}
