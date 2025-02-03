// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_response.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

// From Json Method
CurrencyResponse _$CurrencyResponseFromJson(Map<String, dynamic> json) =>
    CurrencyResponse(
      id: json['id'].toString().toAppInt(),
      code: json['code'].toString().toAppString()!,
      exchangeRate: ExchangeRateResponse.fromJson(json['exchange_rate']),
      isBaseCurrency: json['is_base_currency'] == true,
      name: json['name'].toString().toAppString()!,
      symbol: json['symbol'].toString().toAppString()!,
    );

// To Json Method
Map<String, dynamic> _$CurrencyResponseToJson(CurrencyResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'exchange_rate': instance.exchangeRate.toJson(),
      'is_base_currency': instance.isBaseCurrency,
      'name': instance.name,
      'symbol': instance.symbol,
    };

// Extension for a CurrencyResponse class to provide 'copyWith' method
extension $CurrencyResponseExtension on CurrencyResponse {
  CurrencyResponse copyWith({
    int? id,
    String? code,
    ExchangeRateResponse? exchangeRate,
    bool? isBaseCurrency,
    String? name,
    String? symbol,
  }) {
    return CurrencyResponse(
      id: id ?? this.id,
      code: code ?? this.code,
      exchangeRate: exchangeRate ?? this.exchangeRate,
      isBaseCurrency: isBaseCurrency ?? this.isBaseCurrency,
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
    );
  }
}
