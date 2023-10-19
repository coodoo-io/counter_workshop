// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter_response.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CounterResponseDto {
  String get sysId => throw _privateConstructorUsedError;
  int get counterValue => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CounterResponseDtoCopyWith<CounterResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterResponseDtoCopyWith<$Res> {
  factory $CounterResponseDtoCopyWith(
          CounterResponseDto value, $Res Function(CounterResponseDto) then) =
      _$CounterResponseDtoCopyWithImpl<$Res, CounterResponseDto>;
  @useResult
  $Res call(
      {String sysId,
      int counterValue,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$CounterResponseDtoCopyWithImpl<$Res, $Val extends CounterResponseDto>
    implements $CounterResponseDtoCopyWith<$Res> {
  _$CounterResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sysId = null,
    Object? counterValue = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      sysId: null == sysId
          ? _value.sysId
          : sysId // ignore: cast_nullable_to_non_nullable
              as String,
      counterValue: null == counterValue
          ? _value.counterValue
          : counterValue // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CounterResponseDtoImplCopyWith<$Res>
    implements $CounterResponseDtoCopyWith<$Res> {
  factory _$$CounterResponseDtoImplCopyWith(_$CounterResponseDtoImpl value,
          $Res Function(_$CounterResponseDtoImpl) then) =
      __$$CounterResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sysId,
      int counterValue,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$CounterResponseDtoImplCopyWithImpl<$Res>
    extends _$CounterResponseDtoCopyWithImpl<$Res, _$CounterResponseDtoImpl>
    implements _$$CounterResponseDtoImplCopyWith<$Res> {
  __$$CounterResponseDtoImplCopyWithImpl(_$CounterResponseDtoImpl _value,
      $Res Function(_$CounterResponseDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sysId = null,
    Object? counterValue = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$CounterResponseDtoImpl(
      sysId: null == sysId
          ? _value.sysId
          : sysId // ignore: cast_nullable_to_non_nullable
              as String,
      counterValue: null == counterValue
          ? _value.counterValue
          : counterValue // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$CounterResponseDtoImpl implements _CounterResponseDto {
  const _$CounterResponseDtoImpl(
      {required this.sysId,
      required this.counterValue,
      this.createdAt,
      this.updatedAt});

  @override
  final String sysId;
  @override
  final int counterValue;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'CounterResponseDto(sysId: $sysId, counterValue: $counterValue, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CounterResponseDtoImpl &&
            (identical(other.sysId, sysId) || other.sysId == sysId) &&
            (identical(other.counterValue, counterValue) ||
                other.counterValue == counterValue) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, sysId, counterValue, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CounterResponseDtoImplCopyWith<_$CounterResponseDtoImpl> get copyWith =>
      __$$CounterResponseDtoImplCopyWithImpl<_$CounterResponseDtoImpl>(
          this, _$identity);
}

abstract class _CounterResponseDto implements CounterResponseDto {
  const factory _CounterResponseDto(
      {required final String sysId,
      required final int counterValue,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$CounterResponseDtoImpl;

  @override
  String get sysId;
  @override
  int get counterValue;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$CounterResponseDtoImplCopyWith<_$CounterResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
