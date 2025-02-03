part of 'serializer.dart';

T? deserializeType<T>(dynamic json) {
  var types = [TextFieldByLang,EmptyResponse,ImageResponse,VerifyOtpResponse,RegisterResponse,UploadFileResponse,LanguageResponse,ProfileHiveBox,TokenHivebox,VersionResponse,ExchangeRateResponse,CurrencyResponse];
  if (types.contains(T)) {
    if (T == TextFieldByLang) {
      return TextFieldByLang.fromJson(json) as T;
    } else if (T == EmptyResponse) {
      return EmptyResponse.fromJson(json) as T;
    } else if (T == ImageResponse) {
      return ImageResponse.fromJson(json) as T;
    } else if (T == VerifyOtpResponse) {
      return VerifyOtpResponse.fromJson(json) as T;
    } else if (T == RegisterResponse) {
      return RegisterResponse.fromJson(json) as T;
    } else if (T == UploadFileResponse) {
      return UploadFileResponse.fromJson(json) as T;
    } else if (T == LanguageResponse) {
      return LanguageResponse.fromJson(json) as T;
    } else if (T == ProfileHiveBox) {
      return ProfileHiveBox.fromJson(json) as T;
    } else if (T == TokenHivebox) {
      return TokenHivebox.fromJson(json) as T;
    } else if (T == VersionResponse) {
      return VersionResponse.fromJson(json) as T;
    } else if (T == ExchangeRateResponse) {
      return ExchangeRateResponse.fromJson(json) as T;
    } else if (T == CurrencyResponse) {
      return CurrencyResponse.fromJson(json) as T;
    }
  }
  return null;
}
      