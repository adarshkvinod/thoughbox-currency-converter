part of 'currency_bloc.dart';

@freezed
class CurrencyState with _$CurrencyState {
  factory CurrencyState.initial() => CurrencyState(
    getConversionResultStatus: Status.initial(),
    conversionResult: ConversionResultModel(),
  );
  factory CurrencyState({
required Status getConversionResultStatus,
    required ConversionResultModel conversionResult,
  }) = _CurrencyState;
}
