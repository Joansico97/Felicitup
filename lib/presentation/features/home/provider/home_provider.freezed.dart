// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HomeFeatureModel _$HomeFeatureModelFromJson(Map<String, dynamic> json) {
  return _HomeFeatureModel.fromJson(json);
}

/// @nodoc
mixin _$HomeFeatureModel {
  String get uid => throw _privateConstructorUsedError;
  int get currentIndex => throw _privateConstructorUsedError;
  List<bool> get listBoolsTap => throw _privateConstructorUsedError;
  UserModel get currentUser => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeFeatureModelCopyWith<HomeFeatureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeFeatureModelCopyWith<$Res> {
  factory $HomeFeatureModelCopyWith(
          HomeFeatureModel value, $Res Function(HomeFeatureModel) then) =
      _$HomeFeatureModelCopyWithImpl<$Res, HomeFeatureModel>;
  @useResult
  $Res call(
      {String uid,
      int currentIndex,
      List<bool> listBoolsTap,
      UserModel currentUser});
}

/// @nodoc
class _$HomeFeatureModelCopyWithImpl<$Res, $Val extends HomeFeatureModel>
    implements $HomeFeatureModelCopyWith<$Res> {
  _$HomeFeatureModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? currentIndex = null,
    Object? listBoolsTap = null,
    Object? currentUser = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      listBoolsTap: null == listBoolsTap
          ? _value.listBoolsTap
          : listBoolsTap // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      currentUser: null == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeFeatureModelImplCopyWith<$Res>
    implements $HomeFeatureModelCopyWith<$Res> {
  factory _$$HomeFeatureModelImplCopyWith(_$HomeFeatureModelImpl value,
          $Res Function(_$HomeFeatureModelImpl) then) =
      __$$HomeFeatureModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      int currentIndex,
      List<bool> listBoolsTap,
      UserModel currentUser});
}

/// @nodoc
class __$$HomeFeatureModelImplCopyWithImpl<$Res>
    extends _$HomeFeatureModelCopyWithImpl<$Res, _$HomeFeatureModelImpl>
    implements _$$HomeFeatureModelImplCopyWith<$Res> {
  __$$HomeFeatureModelImplCopyWithImpl(_$HomeFeatureModelImpl _value,
      $Res Function(_$HomeFeatureModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? currentIndex = null,
    Object? listBoolsTap = null,
    Object? currentUser = null,
  }) {
    return _then(_$HomeFeatureModelImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      listBoolsTap: null == listBoolsTap
          ? _value._listBoolsTap
          : listBoolsTap // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      currentUser: null == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeFeatureModelImpl implements _HomeFeatureModel {
  const _$HomeFeatureModelImpl(
      {required this.uid,
      required this.currentIndex,
      required final List<bool> listBoolsTap,
      required this.currentUser})
      : _listBoolsTap = listBoolsTap;

  factory _$HomeFeatureModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeFeatureModelImplFromJson(json);

  @override
  final String uid;
  @override
  final int currentIndex;
  final List<bool> _listBoolsTap;
  @override
  List<bool> get listBoolsTap {
    if (_listBoolsTap is EqualUnmodifiableListView) return _listBoolsTap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listBoolsTap);
  }

  @override
  final UserModel currentUser;

  @override
  String toString() {
    return 'HomeFeatureModel(uid: $uid, currentIndex: $currentIndex, listBoolsTap: $listBoolsTap, currentUser: $currentUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeFeatureModelImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            const DeepCollectionEquality()
                .equals(other._listBoolsTap, _listBoolsTap) &&
            (identical(other.currentUser, currentUser) ||
                other.currentUser == currentUser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, currentIndex,
      const DeepCollectionEquality().hash(_listBoolsTap), currentUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeFeatureModelImplCopyWith<_$HomeFeatureModelImpl> get copyWith =>
      __$$HomeFeatureModelImplCopyWithImpl<_$HomeFeatureModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeFeatureModelImplToJson(
      this,
    );
  }
}

abstract class _HomeFeatureModel implements HomeFeatureModel {
  const factory _HomeFeatureModel(
      {required final String uid,
      required final int currentIndex,
      required final List<bool> listBoolsTap,
      required final UserModel currentUser}) = _$HomeFeatureModelImpl;

  factory _HomeFeatureModel.fromJson(Map<String, dynamic> json) =
      _$HomeFeatureModelImpl.fromJson;

  @override
  String get uid;
  @override
  int get currentIndex;
  @override
  List<bool> get listBoolsTap;
  @override
  UserModel get currentUser;
  @override
  @JsonKey(ignore: true)
  _$$HomeFeatureModelImplCopyWith<_$HomeFeatureModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
