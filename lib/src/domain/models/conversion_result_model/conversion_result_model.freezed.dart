// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversion_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ConversionResultModel _$ConversionResultModelFromJson(
  Map<String, dynamic> json,
) {
  return _ConversionResultModel.fromJson(json);
}

/// @nodoc
mixin _$ConversionResultModel {
  String get base => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  Map<String, double> get result => throw _privateConstructorUsedError;
  int get ms => throw _privateConstructorUsedError;

  /// Serializes this ConversionResultModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConversionResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConversionResultModelCopyWith<ConversionResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversionResultModelCopyWith<$Res> {
  factory $ConversionResultModelCopyWith(
    ConversionResultModel value,
    $Res Function(ConversionResultModel) then,
  ) = _$ConversionResultModelCopyWithImpl<$Res, ConversionResultModel>;
  @useResult
  $Res call({String base, String amount, Map<String, double> result, int ms});
}

/// @nodoc
class _$ConversionResultModelCopyWithImpl<
  $Res,
  $Val extends ConversionResultModel
>
    implements $ConversionResultModelCopyWith<$Res> {
  _$ConversionResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConversionResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base = null,
    Object? amount = null,
    Object? result = null,
    Object? ms = null,
  }) {
    return _then(
      _value.copyWith(
            base: null == base
                ? _value.base
                : base // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as String,
            result: null == result
                ? _value.result
                : result // ignore: cast_nullable_to_non_nullable
                      as Map<String, double>,
            ms: null == ms
                ? _value.ms
                : ms // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ConversionResultModelImplCopyWith<$Res>
    implements $ConversionResultModelCopyWith<$Res> {
  factory _$$ConversionResultModelImplCopyWith(
    _$ConversionResultModelImpl value,
    $Res Function(_$ConversionResultModelImpl) then,
  ) = __$$ConversionResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String base, String amount, Map<String, double> result, int ms});
}

/// @nodoc
class __$$ConversionResultModelImplCopyWithImpl<$Res>
    extends
        _$ConversionResultModelCopyWithImpl<$Res, _$ConversionResultModelImpl>
    implements _$$ConversionResultModelImplCopyWith<$Res> {
  __$$ConversionResultModelImplCopyWithImpl(
    _$ConversionResultModelImpl _value,
    $Res Function(_$ConversionResultModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConversionResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base = null,
    Object? amount = null,
    Object? result = null,
    Object? ms = null,
  }) {
    return _then(
      _$ConversionResultModelImpl(
        base: null == base
            ? _value.base
            : base // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as String,
        result: null == result
            ? _value._result
            : result // ignore: cast_nullable_to_non_nullable
                  as Map<String, double>,
        ms: null == ms
            ? _value.ms
            : ms // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConversionResultModelImpl implements _ConversionResultModel {
  const _$ConversionResultModelImpl({
    this.base = '',
    this.amount = '0',
    final Map<String, double> result = const <String, double>{},
    this.ms = 0,
  }) : _result = result;

  factory _$ConversionResultModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConversionResultModelImplFromJson(json);

  @override
  @JsonKey()
  final String base;
  @override
  @JsonKey()
  final String amount;
  final Map<String, double> _result;
  @override
  @JsonKey()
  Map<String, double> get result {
    if (_result is EqualUnmodifiableMapView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_result);
  }

  @override
  @JsonKey()
  final int ms;

  @override
  String toString() {
    return 'ConversionResultModel(base: $base, amount: $amount, result: $result, ms: $ms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversionResultModelImpl &&
            (identical(other.base, base) || other.base == base) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            const DeepCollectionEquality().equals(other._result, _result) &&
            (identical(other.ms, ms) || other.ms == ms));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    base,
    amount,
    const DeepCollectionEquality().hash(_result),
    ms,
  );

  /// Create a copy of ConversionResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversionResultModelImplCopyWith<_$ConversionResultModelImpl>
  get copyWith =>
      __$$ConversionResultModelImplCopyWithImpl<_$ConversionResultModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ConversionResultModelImplToJson(this);
  }
}

abstract class _ConversionResultModel implements ConversionResultModel {
  const factory _ConversionResultModel({
    final String base,
    final String amount,
    final Map<String, double> result,
    final int ms,
  }) = _$ConversionResultModelImpl;

  factory _ConversionResultModel.fromJson(Map<String, dynamic> json) =
      _$ConversionResultModelImpl.fromJson;

  @override
  String get base;
  @override
  String get amount;
  @override
  Map<String, double> get result;
  @override
  int get ms;

  /// Create a copy of ConversionResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConversionResultModelImplCopyWith<_$ConversionResultModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
