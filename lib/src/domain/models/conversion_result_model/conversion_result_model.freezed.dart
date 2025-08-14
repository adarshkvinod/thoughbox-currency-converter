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
  String get from => throw _privateConstructorUsedError; // added
  String get to => throw _privateConstructorUsedError; // added
  String get amount => throw _privateConstructorUsedError;
  Map<String, double> get result => throw _privateConstructorUsedError;
  int get ms => throw _privateConstructorUsedError;
  bool get isCached => throw _privateConstructorUsedError;
  int get cacheAgeInMinutes => throw _privateConstructorUsedError;

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
  $Res call({
    String from,
    String to,
    String amount,
    Map<String, double> result,
    int ms,
    bool isCached,
    int cacheAgeInMinutes,
  });
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
    Object? from = null,
    Object? to = null,
    Object? amount = null,
    Object? result = null,
    Object? ms = null,
    Object? isCached = null,
    Object? cacheAgeInMinutes = null,
  }) {
    return _then(
      _value.copyWith(
            from: null == from
                ? _value.from
                : from // ignore: cast_nullable_to_non_nullable
                      as String,
            to: null == to
                ? _value.to
                : to // ignore: cast_nullable_to_non_nullable
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
            isCached: null == isCached
                ? _value.isCached
                : isCached // ignore: cast_nullable_to_non_nullable
                      as bool,
            cacheAgeInMinutes: null == cacheAgeInMinutes
                ? _value.cacheAgeInMinutes
                : cacheAgeInMinutes // ignore: cast_nullable_to_non_nullable
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
  $Res call({
    String from,
    String to,
    String amount,
    Map<String, double> result,
    int ms,
    bool isCached,
    int cacheAgeInMinutes,
  });
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
    Object? from = null,
    Object? to = null,
    Object? amount = null,
    Object? result = null,
    Object? ms = null,
    Object? isCached = null,
    Object? cacheAgeInMinutes = null,
  }) {
    return _then(
      _$ConversionResultModelImpl(
        from: null == from
            ? _value.from
            : from // ignore: cast_nullable_to_non_nullable
                  as String,
        to: null == to
            ? _value.to
            : to // ignore: cast_nullable_to_non_nullable
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
        isCached: null == isCached
            ? _value.isCached
            : isCached // ignore: cast_nullable_to_non_nullable
                  as bool,
        cacheAgeInMinutes: null == cacheAgeInMinutes
            ? _value.cacheAgeInMinutes
            : cacheAgeInMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConversionResultModelImpl implements _ConversionResultModel {
  const _$ConversionResultModelImpl({
    this.from = '',
    this.to = '',
    this.amount = '0',
    final Map<String, double> result = const <String, double>{},
    this.ms = 0,
    this.isCached = false,
    this.cacheAgeInMinutes = 0,
  }) : _result = result;

  factory _$ConversionResultModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConversionResultModelImplFromJson(json);

  @override
  @JsonKey()
  final String from;
  // added
  @override
  @JsonKey()
  final String to;
  // added
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
  @JsonKey()
  final bool isCached;
  @override
  @JsonKey()
  final int cacheAgeInMinutes;

  @override
  String toString() {
    return 'ConversionResultModel(from: $from, to: $to, amount: $amount, result: $result, ms: $ms, isCached: $isCached, cacheAgeInMinutes: $cacheAgeInMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversionResultModelImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            const DeepCollectionEquality().equals(other._result, _result) &&
            (identical(other.ms, ms) || other.ms == ms) &&
            (identical(other.isCached, isCached) ||
                other.isCached == isCached) &&
            (identical(other.cacheAgeInMinutes, cacheAgeInMinutes) ||
                other.cacheAgeInMinutes == cacheAgeInMinutes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    from,
    to,
    amount,
    const DeepCollectionEquality().hash(_result),
    ms,
    isCached,
    cacheAgeInMinutes,
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
    final String from,
    final String to,
    final String amount,
    final Map<String, double> result,
    final int ms,
    final bool isCached,
    final int cacheAgeInMinutes,
  }) = _$ConversionResultModelImpl;

  factory _ConversionResultModel.fromJson(Map<String, dynamic> json) =
      _$ConversionResultModelImpl.fromJson;

  @override
  String get from; // added
  @override
  String get to; // added
  @override
  String get amount;
  @override
  Map<String, double> get result;
  @override
  int get ms;
  @override
  bool get isCached;
  @override
  int get cacheAgeInMinutes;

  /// Create a copy of ConversionResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConversionResultModelImplCopyWith<_$ConversionResultModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
