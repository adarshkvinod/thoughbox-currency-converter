// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supported_pairs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SupportedPairsModelImpl _$$SupportedPairsModelImplFromJson(
  Map<String, dynamic> json,
) => _$SupportedPairsModelImpl(
  supportedPairs:
      (json['supportedPairs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  message: json['message'] as String?,
  code: (json['code'] as num?)?.toInt(),
);

Map<String, dynamic> _$$SupportedPairsModelImplToJson(
  _$SupportedPairsModelImpl instance,
) => <String, dynamic>{
  'supportedPairs': instance.supportedPairs,
  'message': instance.message,
  'code': instance.code,
};
