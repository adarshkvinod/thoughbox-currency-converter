part of 'currency_bloc.dart';

@freezed
class CurrencyEvent with _$CurrencyEvent {
  // const factory CurrencyEvent.getSupportedCurrencyPairs() = _GetSupportedCurrencyPairs;
  factory CurrencyEvent.getLiveRate({
    required String pair,
  }) = _GetLiveRate;
}
