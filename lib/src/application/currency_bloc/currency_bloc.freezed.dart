// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CurrencyEvent {
  String get pair => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pair) getLiveRate,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String pair)? getLiveRate,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pair)? getLiveRate,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLiveRate value) getLiveRate,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetLiveRate value)? getLiveRate,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLiveRate value)? getLiveRate,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of CurrencyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrencyEventCopyWith<CurrencyEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyEventCopyWith<$Res> {
  factory $CurrencyEventCopyWith(
    CurrencyEvent value,
    $Res Function(CurrencyEvent) then,
  ) = _$CurrencyEventCopyWithImpl<$Res, CurrencyEvent>;
  @useResult
  $Res call({String pair});
}

/// @nodoc
class _$CurrencyEventCopyWithImpl<$Res, $Val extends CurrencyEvent>
    implements $CurrencyEventCopyWith<$Res> {
  _$CurrencyEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrencyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? pair = null}) {
    return _then(
      _value.copyWith(
            pair: null == pair
                ? _value.pair
                : pair // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GetLiveRateImplCopyWith<$Res>
    implements $CurrencyEventCopyWith<$Res> {
  factory _$$GetLiveRateImplCopyWith(
    _$GetLiveRateImpl value,
    $Res Function(_$GetLiveRateImpl) then,
  ) = __$$GetLiveRateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String pair});
}

/// @nodoc
class __$$GetLiveRateImplCopyWithImpl<$Res>
    extends _$CurrencyEventCopyWithImpl<$Res, _$GetLiveRateImpl>
    implements _$$GetLiveRateImplCopyWith<$Res> {
  __$$GetLiveRateImplCopyWithImpl(
    _$GetLiveRateImpl _value,
    $Res Function(_$GetLiveRateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CurrencyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? pair = null}) {
    return _then(
      _$GetLiveRateImpl(
        pair: null == pair
            ? _value.pair
            : pair // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$GetLiveRateImpl implements _GetLiveRate {
  _$GetLiveRateImpl({required this.pair});

  @override
  final String pair;

  @override
  String toString() {
    return 'CurrencyEvent.getLiveRate(pair: $pair)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLiveRateImpl &&
            (identical(other.pair, pair) || other.pair == pair));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pair);

  /// Create a copy of CurrencyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetLiveRateImplCopyWith<_$GetLiveRateImpl> get copyWith =>
      __$$GetLiveRateImplCopyWithImpl<_$GetLiveRateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pair) getLiveRate,
  }) {
    return getLiveRate(pair);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String pair)? getLiveRate,
  }) {
    return getLiveRate?.call(pair);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pair)? getLiveRate,
    required TResult orElse(),
  }) {
    if (getLiveRate != null) {
      return getLiveRate(pair);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLiveRate value) getLiveRate,
  }) {
    return getLiveRate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetLiveRate value)? getLiveRate,
  }) {
    return getLiveRate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLiveRate value)? getLiveRate,
    required TResult orElse(),
  }) {
    if (getLiveRate != null) {
      return getLiveRate(this);
    }
    return orElse();
  }
}

abstract class _GetLiveRate implements CurrencyEvent {
  factory _GetLiveRate({required final String pair}) = _$GetLiveRateImpl;

  @override
  String get pair;

  /// Create a copy of CurrencyEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetLiveRateImplCopyWith<_$GetLiveRateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CurrencyState {
  // required Status getSupportedPairStatus,
  // required SupportedPairsModel supportedCurrencyPairs,
  Status get getLiveRateStatus => throw _privateConstructorUsedError;

  /// Create a copy of CurrencyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrencyStateCopyWith<CurrencyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyStateCopyWith<$Res> {
  factory $CurrencyStateCopyWith(
    CurrencyState value,
    $Res Function(CurrencyState) then,
  ) = _$CurrencyStateCopyWithImpl<$Res, CurrencyState>;
  @useResult
  $Res call({Status getLiveRateStatus});

  $StatusCopyWith<$Res> get getLiveRateStatus;
}

/// @nodoc
class _$CurrencyStateCopyWithImpl<$Res, $Val extends CurrencyState>
    implements $CurrencyStateCopyWith<$Res> {
  _$CurrencyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrencyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? getLiveRateStatus = null}) {
    return _then(
      _value.copyWith(
            getLiveRateStatus: null == getLiveRateStatus
                ? _value.getLiveRateStatus
                : getLiveRateStatus // ignore: cast_nullable_to_non_nullable
                      as Status,
          )
          as $Val,
    );
  }

  /// Create a copy of CurrencyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get getLiveRateStatus {
    return $StatusCopyWith<$Res>(_value.getLiveRateStatus, (value) {
      return _then(_value.copyWith(getLiveRateStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CurrencyStateImplCopyWith<$Res>
    implements $CurrencyStateCopyWith<$Res> {
  factory _$$CurrencyStateImplCopyWith(
    _$CurrencyStateImpl value,
    $Res Function(_$CurrencyStateImpl) then,
  ) = __$$CurrencyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status getLiveRateStatus});

  @override
  $StatusCopyWith<$Res> get getLiveRateStatus;
}

/// @nodoc
class __$$CurrencyStateImplCopyWithImpl<$Res>
    extends _$CurrencyStateCopyWithImpl<$Res, _$CurrencyStateImpl>
    implements _$$CurrencyStateImplCopyWith<$Res> {
  __$$CurrencyStateImplCopyWithImpl(
    _$CurrencyStateImpl _value,
    $Res Function(_$CurrencyStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CurrencyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? getLiveRateStatus = null}) {
    return _then(
      _$CurrencyStateImpl(
        getLiveRateStatus: null == getLiveRateStatus
            ? _value.getLiveRateStatus
            : getLiveRateStatus // ignore: cast_nullable_to_non_nullable
                  as Status,
      ),
    );
  }
}

/// @nodoc

class _$CurrencyStateImpl implements _CurrencyState {
  _$CurrencyStateImpl({required this.getLiveRateStatus});

  // required Status getSupportedPairStatus,
  // required SupportedPairsModel supportedCurrencyPairs,
  @override
  final Status getLiveRateStatus;

  @override
  String toString() {
    return 'CurrencyState(getLiveRateStatus: $getLiveRateStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyStateImpl &&
            (identical(other.getLiveRateStatus, getLiveRateStatus) ||
                other.getLiveRateStatus == getLiveRateStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, getLiveRateStatus);

  /// Create a copy of CurrencyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyStateImplCopyWith<_$CurrencyStateImpl> get copyWith =>
      __$$CurrencyStateImplCopyWithImpl<_$CurrencyStateImpl>(this, _$identity);
}

abstract class _CurrencyState implements CurrencyState {
  factory _CurrencyState({required final Status getLiveRateStatus}) =
      _$CurrencyStateImpl;

  // required Status getSupportedPairStatus,
  // required SupportedPairsModel supportedCurrencyPairs,
  @override
  Status get getLiveRateStatus;

  /// Create a copy of CurrencyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrencyStateImplCopyWith<_$CurrencyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
