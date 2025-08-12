// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supported_pairs_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SupportedPairsModel _$SupportedPairsModelFromJson(Map<String, dynamic> json) {
  return _SupportedPairsModel.fromJson(json);
}

/// @nodoc
mixin _$SupportedPairsModel {
  List<String> get supportedPairs => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;

  /// Serializes this SupportedPairsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SupportedPairsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SupportedPairsModelCopyWith<SupportedPairsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportedPairsModelCopyWith<$Res> {
  factory $SupportedPairsModelCopyWith(
    SupportedPairsModel value,
    $Res Function(SupportedPairsModel) then,
  ) = _$SupportedPairsModelCopyWithImpl<$Res, SupportedPairsModel>;
  @useResult
  $Res call({List<String> supportedPairs, String? message, int? code});
}

/// @nodoc
class _$SupportedPairsModelCopyWithImpl<$Res, $Val extends SupportedPairsModel>
    implements $SupportedPairsModelCopyWith<$Res> {
  _$SupportedPairsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SupportedPairsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supportedPairs = null,
    Object? message = freezed,
    Object? code = freezed,
  }) {
    return _then(
      _value.copyWith(
            supportedPairs: null == supportedPairs
                ? _value.supportedPairs
                : supportedPairs // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            code: freezed == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SupportedPairsModelImplCopyWith<$Res>
    implements $SupportedPairsModelCopyWith<$Res> {
  factory _$$SupportedPairsModelImplCopyWith(
    _$SupportedPairsModelImpl value,
    $Res Function(_$SupportedPairsModelImpl) then,
  ) = __$$SupportedPairsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> supportedPairs, String? message, int? code});
}

/// @nodoc
class __$$SupportedPairsModelImplCopyWithImpl<$Res>
    extends _$SupportedPairsModelCopyWithImpl<$Res, _$SupportedPairsModelImpl>
    implements _$$SupportedPairsModelImplCopyWith<$Res> {
  __$$SupportedPairsModelImplCopyWithImpl(
    _$SupportedPairsModelImpl _value,
    $Res Function(_$SupportedPairsModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SupportedPairsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supportedPairs = null,
    Object? message = freezed,
    Object? code = freezed,
  }) {
    return _then(
      _$SupportedPairsModelImpl(
        supportedPairs: null == supportedPairs
            ? _value._supportedPairs
            : supportedPairs // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        code: freezed == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SupportedPairsModelImpl implements _SupportedPairsModel {
  const _$SupportedPairsModelImpl({
    final List<String> supportedPairs = const [],
    this.message,
    this.code,
  }) : _supportedPairs = supportedPairs;

  factory _$SupportedPairsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SupportedPairsModelImplFromJson(json);

  final List<String> _supportedPairs;
  @override
  @JsonKey()
  List<String> get supportedPairs {
    if (_supportedPairs is EqualUnmodifiableListView) return _supportedPairs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_supportedPairs);
  }

  @override
  final String? message;
  @override
  final int? code;

  @override
  String toString() {
    return 'SupportedPairsModel(supportedPairs: $supportedPairs, message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupportedPairsModelImpl &&
            const DeepCollectionEquality().equals(
              other._supportedPairs,
              _supportedPairs,
            ) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_supportedPairs),
    message,
    code,
  );

  /// Create a copy of SupportedPairsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SupportedPairsModelImplCopyWith<_$SupportedPairsModelImpl> get copyWith =>
      __$$SupportedPairsModelImplCopyWithImpl<_$SupportedPairsModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SupportedPairsModelImplToJson(this);
  }
}

abstract class _SupportedPairsModel implements SupportedPairsModel {
  const factory _SupportedPairsModel({
    final List<String> supportedPairs,
    final String? message,
    final int? code,
  }) = _$SupportedPairsModelImpl;

  factory _SupportedPairsModel.fromJson(Map<String, dynamic> json) =
      _$SupportedPairsModelImpl.fromJson;

  @override
  List<String> get supportedPairs;
  @override
  String? get message;
  @override
  int? get code;

  /// Create a copy of SupportedPairsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SupportedPairsModelImplCopyWith<_$SupportedPairsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
