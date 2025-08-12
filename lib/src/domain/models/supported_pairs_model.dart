import 'package:freezed_annotation/freezed_annotation.dart';

part 'supported_pairs_model.freezed.dart';
part 'supported_pairs_model.g.dart';

@freezed
class SupportedPairsModel with _$SupportedPairsModel {
  const factory SupportedPairsModel({
    @Default([]) List<String> supportedPairs,
    String? message,
    int? code,
  }) = _SupportedPairsModel;

  factory SupportedPairsModel.fromJson(Map<String, dynamic> json) =>
      _$SupportedPairsModelFromJson(json);
}
