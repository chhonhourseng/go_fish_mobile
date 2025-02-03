import 'package:app/export.dart';
import 'package:annotations/annotations.dart';
part 'exchange_rate_response.g.dart';

@JsonAnnotation()
class ExchangeRateResponse {

  ExchangeRateResponse({
    required this.cashInRate,
    required this.cashOutRate,
    required this.createdAt,
    required this.currencyId,
    required this.id,
  });

  final int cashInRate;
  final int cashOutRate;
  final String createdAt;
  final int currencyId;
  final int id;

  // fromJson
  factory ExchangeRateResponse.fromJson(Map<String, dynamic> json) => _$ExchangeRateResponseFromJson(json);
  // toJson
  Map<String, dynamic> toJson() => _$ExchangeRateResponseToJson(this);
}

extension $CustomExchangeRateResponseExtension on ExchangeRateResponse {

}