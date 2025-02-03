// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rate_response.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

// From Json Method
ExchangeRateResponse _$ExchangeRateResponseFromJson(
        Map<String, dynamic> json) =>
    ExchangeRateResponse(
      cashInRate: json['cash_in_rate'].toString().toAppInt(),
      cashOutRate: json['cash_out_rate'].toString().toAppInt(),
      createdAt: json['created_at'].toString().toAppString()!,
      currencyId: json['currency_id'].toString().toAppInt(),
      id: json['id'].toString().toAppInt(),
    );

// To Json Method
Map<String, dynamic> _$ExchangeRateResponseToJson(
        ExchangeRateResponse instance) =>
    <String, dynamic>{
      'cash_in_rate': instance.cashInRate,
      'cash_out_rate': instance.cashOutRate,
      'created_at': instance.createdAt,
      'currency_id': instance.currencyId,
      'id': instance.id,
    };

// Extension for a ExchangeRateResponse class to provide 'copyWith' method
extension $ExchangeRateResponseExtension on ExchangeRateResponse {
  ExchangeRateResponse copyWith({
    int? cashInRate,
    int? cashOutRate,
    String? createdAt,
    int? currencyId,
    int? id,
  }) {
    return ExchangeRateResponse(
      cashInRate: cashInRate ?? this.cashInRate,
      cashOutRate: cashOutRate ?? this.cashOutRate,
      createdAt: createdAt ?? this.createdAt,
      currencyId: currencyId ?? this.currencyId,
      id: id ?? this.id,
    );
  }
}
