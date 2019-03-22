// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterBase _$RegisterBaseFromJson(Map<String, dynamic> json) {
  return RegisterBase(
      json['errorMsg'] as String,
      json['errorCode'] as int,
      json['data'] == null
          ? null
          : Register.fromJson(json['data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$RegisterBaseToJson(RegisterBase instance) =>
    <String, dynamic>{
      'errorMsg': instance.errorMsg,
      'errorCode': instance.errorCode,
      'data': instance.data
    };
