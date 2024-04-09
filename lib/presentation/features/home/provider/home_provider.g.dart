// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeFeatureModelImpl _$$HomeFeatureModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HomeFeatureModelImpl(
      uid: json['uid'] as String,
      currentIndex: json['currentIndex'] as int,
      listBoolsTap: (json['listBoolsTap'] as List<dynamic>)
          .map((e) => e as bool)
          .toList(),
      currentUser:
          UserModel.fromJson(json['currentUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HomeFeatureModelImplToJson(
        _$HomeFeatureModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'currentIndex': instance.currentIndex,
      'listBoolsTap': instance.listBoolsTap,
      'currentUser': instance.currentUser,
    };
