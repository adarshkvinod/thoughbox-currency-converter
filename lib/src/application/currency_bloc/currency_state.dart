part of 'currency_bloc.dart';

@freezed
class CurrencyState with _$CurrencyState {
  factory CurrencyState.initial() => CurrencyState(
    // getSupportedPairStatus: Status.initial(),
    // supportedCurrencyPairs: SupportedPairsModel(),
    getLiveRateStatus: Status.initial(),
  );
  factory CurrencyState({
    // required Status getSupportedPairStatus,
    // required SupportedPairsModel supportedCurrencyPairs,
required Status getLiveRateStatus
  }) = _CurrencyState;
}
