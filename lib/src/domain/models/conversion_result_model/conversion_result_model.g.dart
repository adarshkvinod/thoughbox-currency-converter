// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversion_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversionResultModelImpl _$$ConversionResultModelImplFromJson(
  Map<String, dynamic> json,
) => _$ConversionResultModelImpl(
  base: json['base'] as String? ?? '',
  amount: json['amount'] as String? ?? '0',
  result:
      (json['result'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ) ??
      const <String, double>{},
  ms: (json['ms'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$ConversionResultModelImplToJson(
  _$ConversionResultModelImpl instance,
) => <String, dynamic>{
  'base': instance.base,
  'amount': instance.amount,
  'result': instance.result,
  'ms': instance.ms,
};
