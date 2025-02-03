import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:app/export.dart';

class AppHttpHelper {
  static final Dio _dio = DioClient.instance;

  static Map<String, dynamic> response(Response<dynamic>? response) {
    if (response == null) {
      throw AppHttpError(status: AppHttpStatus.error, message: T.somethingUnexpectedWentWrong.r);
    }
    late Map<String, dynamic> result;
    try {
      result = json.decode(response.toString());
    } catch (_) {
      throw AppHttpError(status: AppHttpStatus.error, message: T.somethingUnexpectedWentWrong.r);
    }
    final statusCode = response.statusCode;
    if (statusCode != null) {
      if (statusCode >= 200 && statusCode <= 299) {
        //appEventBus.fire(const EventBusUnderMaintenance(false));
        return result;
        /*if (checkKeyMap(result, 'message')) {
          if (result['message'] == 'success') {
          }
        }*/
      }
    }
    throw AppHttpError(status: AppHttpStatus.error, message: checkKeyMap(result, 'message') ? result['message'] : T.somethingUnexpectedWentWrong.r);
  }

  static Map<String, dynamic> socketResponse(Map<String, dynamic>? response) {
    if (response == null) {
      throw AppHttpError(status: AppHttpStatus.error, message: T.somethingUnexpectedWentWrong.r);
    }
    if (checkKeyMap(response, 'message')) {
      if (response['message'] == 'success') {
        return response;
      }
    }
    throw AppHttpError(status: AppHttpStatus.error, message: checkKeyMap(response, 'message') ? response['message'] : T.somethingUnexpectedWentWrong.r);
  }

  static retryRequest(DioError error, ErrorInterceptorHandler _handler) async {
    final v = await _dio.request(
      error.requestOptions.path,
      data: error.requestOptions.data,
      options: getOptions(error.requestOptions),
      onSendProgress: error.requestOptions.onSendProgress,
      onReceiveProgress: error.requestOptions.onReceiveProgress,
      queryParameters: error.requestOptions.queryParameters,
    );
    return _handler.resolve(v);
  }

  static Options getOptions(RequestOptions requestOptions) {
    return Options(
      sendTimeout: requestOptions.sendTimeout,
      receiveTimeout: requestOptions.receiveTimeout,
      headers: requestOptions.headers,
      extra: requestOptions.extra,
      method: requestOptions.method,
      responseType: requestOptions.responseType,
      contentType: requestOptions.contentType,
      validateStatus: requestOptions.validateStatus,
      receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
      followRedirects: requestOptions.followRedirects,
      maxRedirects: requestOptions.maxRedirects,
      requestEncoder: requestOptions.requestEncoder,
      responseDecoder: requestOptions.responseDecoder,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
