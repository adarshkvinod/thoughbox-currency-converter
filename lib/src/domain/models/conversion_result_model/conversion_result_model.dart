import 'package:freezed_annotation/freezed_annotation.dart';
part 'conversion_result_model.freezed.dart';
part 'conversion_result_model.g.dart';

@freezed
class ConversionResultModel with _$ConversionResultModel {
  const factory ConversionResultModel({
    @Default('') String from,              // added
    @Default('') String to,                // added
    @Default('0') String amount,
    @Default(<String, double>{}) Map<String, double> result,
    @Default(0) int ms,
    @Default(false) bool isCached,
    @Default(0) int cacheAgeInMinutes,
  }) = _ConversionResultModel;

  factory ConversionResultModel.fromJson(Map<String, dynamic> json) =>
      _$ConversionResultModelFromJson(json);
}
