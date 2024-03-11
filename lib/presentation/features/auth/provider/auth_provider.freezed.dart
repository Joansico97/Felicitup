// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthFeatureModel _$AuthFeatureModelFromJson(Map<String, dynamic> json) {
  return _AuthFeatureModel.fromJson(json);
}

/// @nodoc
mixin _$AuthFeatureModel {
  bool get isObscure => throw _privateConstructorUsedError;
  bool get isRepObscure => throw _privateConstructorUsedError;
  bool get checkTerms => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get birthDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthFeatureModelCopyWith<AuthFeatureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFeatureModelCopyWith<$Res> {
  factory $AuthFeatureModelCopyWith(
          AuthFeatureModel value, $Res Function(AuthFeatureModel) then) =
      _$AuthFeatureModelCopyWithImpl<$Res, AuthFeatureModel>;
  @useResult
  $Res call(
      {bool isObscure,
      bool isRepObscure,
      bool checkTerms,
      bool isLoading,
      String birthDate});
}

/// @nodoc
class _$AuthFeatureModelCopyWithImpl<$Res, $Val extends AuthFeatureModel>
    implements $AuthFeatureModelCopyWith<$Res> {
  _$AuthFeatureModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isObscure = null,
    Object? isRepObscure = null,
    Object? checkTerms = null,
    Object? isLoading = null,
    Object? birthDate = null,
  }) {
    return _then(_value.copyWith(
      isObscure: null == isObscure
          ? _value.isObscure
          : isObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      isRepObscure: null == isRepObscure
          ? _value.isRepObscure
          : isRepObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      checkTerms: null == checkTerms
          ? _value.checkTerms
          : checkTerms // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthFeatureModelImplCopyWith<$Res>
    implements $AuthFeatureModelCopyWith<$Res> {
  factory _$$AuthFeatureModelImplCopyWith(_$AuthFeatureModelImpl value,
          $Res Function(_$AuthFeatureModelImpl) then) =
      __$$AuthFeatureModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isObscure,
      bool isRepObscure,
      bool checkTerms,
      bool isLoading,
      String birthDate});
}

/// @nodoc
class __$$AuthFeatureModelImplCopyWithImpl<$Res>
    extends _$AuthFeatureModelCopyWithImpl<$Res, _$AuthFeatureModelImpl>
    implements _$$AuthFeatureModelImplCopyWith<$Res> {
  __$$AuthFeatureModelImplCopyWithImpl(_$AuthFeatureModelImpl _value,
      $Res Function(_$AuthFeatureModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isObscure = null,
    Object? isRepObscure = null,
    Object? checkTerms = null,
    Object? isLoading = null,
    Object? birthDate = null,
  }) {
    return _then(_$AuthFeatureModelImpl(
      isObscure: null == isObscure
          ? _value.isObscure
          : isObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      isRepObscure: null == isRepObscure
          ? _value.isRepObscure
          : isRepObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      checkTerms: null == checkTerms
          ? _value.checkTerms
          : checkTerms // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthFeatureModelImpl implements _AuthFeatureModel {
  const _$AuthFeatureModelImpl(
      {required this.isObscure,
      required this.isRepObscure,
      required this.checkTerms,
      required this.isLoading,
      required this.birthDate});

  factory _$AuthFeatureModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthFeatureModelImplFromJson(json);

  @override
  final bool isObscure;
  @override
  final bool isRepObscure;
  @override
  final bool checkTerms;
  @override
  final bool isLoading;
  @override
  final String birthDate;

  @override
  String toString() {
    return 'AuthFeatureModel(isObscure: $isObscure, isRepObscure: $isRepObscure, checkTerms: $checkTerms, isLoading: $isLoading, birthDate: $birthDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthFeatureModelImpl &&
            (identical(other.isObscure, isObscure) ||
                other.isObscure == isObscure) &&
            (identical(other.isRepObscure, isRepObscure) ||
                other.isRepObscure == isRepObscure) &&
            (identical(other.checkTerms, checkTerms) ||
                other.checkTerms == checkTerms) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, isObscure, isRepObscure, checkTerms, isLoading, birthDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthFeatureModelImplCopyWith<_$AuthFeatureModelImpl> get copyWith =>
      __$$AuthFeatureModelImplCopyWithImpl<_$AuthFeatureModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthFeatureModelImplToJson(
      this,
    );
  }
}

abstract class _AuthFeatureModel implements AuthFeatureModel {
  const factory _AuthFeatureModel(
      {required final bool isObscure,
      required final bool isRepObscure,
      required final bool checkTerms,
      required final bool isLoading,
      required final String birthDate}) = _$AuthFeatureModelImpl;

  factory _AuthFeatureModel.fromJson(Map<String, dynamic> json) =
      _$AuthFeatureModelImpl.fromJson;

  @override
  bool get isObscure;
  @override
  bool get isRepObscure;
  @override
  bool get checkTerms;
  @override
  bool get isLoading;
  @override
  String get birthDate;
  @override
  @JsonKey(ignore: true)
  _$$AuthFeatureModelImplCopyWith<_$AuthFeatureModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
