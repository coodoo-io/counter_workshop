// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CounterEntity {
  int get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CounterEntityCopyWith<CounterEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterEntityCopyWith<$Res> {
  factory $CounterEntityCopyWith(
          CounterEntity value, $Res Function(CounterEntity) then) =
      _$CounterEntityCopyWithImpl<$Res, CounterEntity>;
  @useResult
  $Res call({int value});
}

/// @nodoc
class _$CounterEntityCopyWithImpl<$Res, $Val extends CounterEntity>
    implements $CounterEntityCopyWith<$Res> {
  _$CounterEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CounterEntityImplCopyWith<$Res>
    implements $CounterEntityCopyWith<$Res> {
  factory _$$CounterEntityImplCopyWith(
          _$CounterEntityImpl value, $Res Function(_$CounterEntityImpl) then) =
      __$$CounterEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int value});
}

/// @nodoc
class __$$CounterEntityImplCopyWithImpl<$Res>
    extends _$CounterEntityCopyWithImpl<$Res, _$CounterEntityImpl>
    implements _$$CounterEntityImplCopyWith<$Res> {
  __$$CounterEntityImplCopyWithImpl(
      _$CounterEntityImpl _value, $Res Function(_$CounterEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$CounterEntityImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CounterEntityImpl implements _CounterEntity {
  _$CounterEntityImpl({required this.value});

  @override
  final int value;

  @override
  String toString() {
    return 'CounterEntity(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CounterEntityImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CounterEntityImplCopyWith<_$CounterEntityImpl> get copyWith =>
      __$$CounterEntityImplCopyWithImpl<_$CounterEntityImpl>(this, _$identity);
}

abstract class _CounterEntity implements CounterEntity {
  factory _CounterEntity({required final int value}) = _$CounterEntityImpl;

  @override
  int get value;
  @override
  @JsonKey(ignore: true)
  _$$CounterEntityImplCopyWith<_$CounterEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
