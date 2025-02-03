// ignore_for_file: unused_element
import 'dart:convert';

import 'package:app/export.dart';
import "package:dio/dio.dart";

class CustomException {
  const CustomException([this.error]);

  final dynamic error;

  @override
  String toString() {
    try {
      if (error is DioException) {
        if (kDebugMode) {}
        final _error = error as DioException;
        /*try {
          if (_error.error.osError?.message.contains('Connection refused') == true) {
            return T.appIsUnderMaintenance.r;
          }
        } catch (_) {}*/

        if (_error.type == DioExceptionType.connectionError) {
          if (_error.response?.statusCode == 503 || _error.response?.statusCode == 502) {
            //appEventBus.fire(const EventBusUnderMaintenance(true));
            return T.appIsUnderMaintenance.r;
          }
        }
        final response = _error.response;
        if (response != null) {
          Map<String, dynamic> result = json.decode(response.toString());
          return checkKeyMap(result, 'message') ? result['message'] : T.somethingUnexpectedWentWrong.r;
        }
      } else if (error is AppHttpError) {
        return error.toString();
      }
      return T.somethingUnexpectedWentWrong.r;
    } catch (_) {
      if (kDebugMode) {}
      return T.somethingUnexpectedWentWrong.r;
    }
  }
}
