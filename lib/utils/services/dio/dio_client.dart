import "dart:async";
import "dart:developer";

import 'package:app/export.dart';
import "package:dio/dio.dart";
import 'package:path/path.dart' as path;

class DioClient {
  DioClient._();

  static Dio? _dio;

  static Dio get instance => _dio ??= getInstance();

  //header
  static Dio getInstance() {
    if (kDebugMode) {
      logInfo(app.getConfigBaseUrl, name: 'BaseUrl');
    }
    Dio httpClient = Dio(BaseOptions(
      receiveTimeout: const Duration(milliseconds: 10000),
      sendTimeout: const Duration(milliseconds: 10000),
      baseUrl: app.getConfigBaseUrl,
      headers: {
        "Content-Type": "application/json",
        'Accept': '*/*',
        'Access-Control-Allow-Origin': '*',
        'x-language': app.currentAppLocale.languageCode,
      },
    ));

    httpClient.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (kDebugMode) {
            log(options.path, name: 'DioPath');
          }
          final String? userToken = app.token?.accessToken;
          options.headers.addAll({
            if (userToken != null) "Authorization": "Bearer $userToken",
          });
          return handler.next(options);
        },
        onError: (error, handler) async {
          logError(
              'Error ->> ${error.requestOptions.baseUrl}${error.requestOptions.uri.path}',
              name: 'Dio');
          return handler.next(error);
        },
        onResponse: (response, handler) async {
          handler.next(response);
        },
      ),
    );

    _dio = httpClient;
    return httpClient;
  }

  static Future<BaseResponse<K>> postMethod<K>({
    Map<String, dynamic>? request,
    required String path,
    void Function(int, int)? onSendProgress,
    void Function(dynamic)? onResponse,
    CancelToken? cancelToken,
    Map<String, File>? file,
    Map<String, List<File>>? files,
    Duration? receiveTimeout,
    Duration? sendTimeout,
  }) async {
    try {
      Dio dio = DioClient.instance;
      var res = await dio.post(
        path,
        data: await _formData(request: request, file: file, files: files),
        options: Options(
          receiveTimeout: receiveTimeout,
          sendTimeout: sendTimeout,
        ),
        onSendProgress: onSendProgress,
        cancelToken: cancelToken,
      );
      //log('Response: $res', name: 'POST');
      return BaseResponse.fromMap(res, (data) {
        try {
          onResponse?.call(data);
        } catch (_) {}
        return deserialize<K>(data);
      });
    } catch (e) {
      if (kDebugMode) {}
      throw CustomException(e).toString();
    }
  }

  static Future<BaseResponse<K>> getMethod<K>({
    required String path,
    Map<String, dynamic>? queryParameters,
    void Function(dynamic)? onResponse,
    Duration? receiveTimeout,
    Duration? sendTimeout,
    CancelToken? cancelToken,
  }) async {
    // print(app.token?.accessToken);
    try {
      /// Test slow performance 15s
      // await Future.delayed(const Duration(seconds: 15));
      Dio dio = DioClient.instance;
      var res = await dio.get(
        path,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: Options(
          receiveTimeout: receiveTimeout,
          sendTimeout: sendTimeout,
        ),
      );
      //log('Response: $res', name: 'GET');
      if (kDebugMode) {}
      return BaseResponse.fromMap(res, (data) {
        try {
          onResponse?.call(data);
        } catch (_) {}
        return deserialize<K>(data);
      });
    } catch (e) {
      if (kDebugMode) {}
      throw CustomException(e).toString();
    }
  }

  static Future<BaseResponse<K>> putMethod<K>({
    Map<String, dynamic>? request,
    required String path,
    void Function(dynamic)? onResponse,
    Map<String, File>? file,
    Map<String, List<File>>? files,
    Duration? receiveTimeout,
    Duration? sendTimeout,
    CancelToken? cancelToken,
  }) async {
    try {
      Dio dio = DioClient.instance;
      var res = await dio.put(
        path,
        data: await _formData(request: request, file: file, files: files),
        cancelToken: cancelToken,
        options: Options(
          receiveTimeout: receiveTimeout,
          sendTimeout: sendTimeout,
        ),
      );
      //log('Response: $res', name: 'PUT');
      return BaseResponse.fromMap(res, (data) {
        try {
          onResponse?.call(data);
        } catch (_) {}
        return deserialize<K>(data);
      });
    } catch (e) {
      if (kDebugMode) {}
      throw CustomException(e).toString();
    }
  }

  static Future<BaseResponse<K>> deleteMethod<K>({
    dynamic request,
    required String path,
    void Function(dynamic)? onResponse,
    Duration? receiveTimeout,
    Duration? sendTimeout,
    CancelToken? cancelToken,
  }) async {
    try {
      Dio dio = DioClient.instance;
      var res = await dio.delete(
        path,
        data: request,
        cancelToken: cancelToken,
        options: Options(
          receiveTimeout: receiveTimeout,
          sendTimeout: sendTimeout,
        ),
      );
      //log('Response: $res', name: 'DELETE');
      return BaseResponse.fromMap(res, (data) {
        try {
          onResponse?.call(data);
        } catch (_) {}
        return deserialize<K>(data);
      });
    } catch (e) {
      if (kDebugMode) {}
      throw CustomException(e).toString();
    }
  }

  static Future<dynamic> _formData({
    Map<String, dynamic>? request,
    Map<String, File>? file,
    Map<String, List<File>>? files,
  }) async {
    if ((file?.isEmpty ?? true) && (files?.isEmpty ?? true)) {
      return request;
    }

    /// Single File :::::::::::::::::::::::::::::::
    Map<String, dynamic> fromFile = {};
    if (file?.isNotEmpty ?? false) {
      for (var v in file!.entries) {
        fromFile[v.key] = await MultipartFile.fromFile(v.value.path,
            filename: path.basename(v.value.path));
      }
      if (request == null) {
        return FormData.fromMap({...fromFile});
      } else {
        return FormData.fromMap({...fromFile, ...request});
      }
    }

    /// Multiple Files :::::::::::::::::::::::::::::::
    if (files?.isNotEmpty ?? false) {
      for (var v in files!.entries) {
        List<MultipartFile> fromFiles = [];
        for (var e in v.value) {
          fromFiles.add(await MultipartFile.fromFile(e.path,
              filename: path.basename(e.path)));
        }
        fromFile[v.key] = fromFiles;
      }
      if (request == null) {
        return FormData.fromMap({...fromFile});
      } else {
        return FormData.fromMap({...fromFile, ...request});
      }
    }
  }
}
