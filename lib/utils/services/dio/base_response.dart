import 'package:dio/dio.dart';
import 'package:app/export.dart';

class BaseResponse<K> {
  String message;
  List<K>? list;
  K? data;
  final bool isNext;
  final bool isPrev;

  BaseResponse({
    required this.message,
    required this.data,
    required this.list,
    required this.isNext,
    required this.isPrev,
  });

  factory BaseResponse.fromMap(dynamic response, K Function(Map<String, dynamic>) create) {
    try {
      final json = response is Response ? AppHttpHelper.response(response) : AppHttpHelper.socketResponse(response);
      if (kDebugMode) {}
      final _json = json["data"];
      final List<K>? itemList = _json != null && _json is List ? List<K>.from(_json.map((x) => create(x))) : null;
      final K? itemMap = _json != null && _json is Map ? create(_json as Map<String, dynamic>) : null;
      return BaseResponse<K>(
        message: json["message"].toString().toAppString()!,
        data: itemMap,
        list: itemList,
        isNext: (!checkKeyMap(json, 'isNext') ? false : json["isNext"] == true),
        isPrev: (!checkKeyMap(json, 'isPrev') ? false : json["isPrev"] == true),
      );
    } catch (e) {
      logError('Error ->> Parse Response data', name: 'Response');
      rethrow;
    }
  }
}
