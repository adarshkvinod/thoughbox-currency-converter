part of 'currency_bloc.dart';

@freezed
class CurrencyEvent with _$CurrencyEvent {
  // const factory CurrencyEvent.getSupportedCurrencyPairs() = _GetSupportedCurrencyPairs;
  factory CurrencyEvent.getConversionResult({
    required String from,
    required String to,
    required double amount,
  }) = _GetConversionResult;
  const factory CurrencyEvent.clearConversionData() = _ClearConversionData;
}
