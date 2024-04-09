// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthFeatureModelImpl _$$AuthFeatureModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthFeatureModelImpl(
      isObscure: json['isObscure'] as bool,
      isRepObscure: json['isRepObscure'] as bool,
      checkTerms: json['checkTerms'] as bool,
      isLoading: json['isLoading'] as bool,
      isValidate: json['isValidate'] as bool,
      birthDate: json['birthDate'] as String,
    );

Map<String, dynamic> _$$AuthFeatureModelImplToJson(
        _$AuthFeatureModelImpl instance) =>
    <String, dynamic>{
      'isObscure': instance.isObscure,
      'isRepObscure': instance.isRepObscure,
      'checkTerms': instance.checkTerms,
      'isLoading': instance.isLoading,
      'isValidate': instance.isValidate,
      'birthDate': instance.birthDate,
    };
