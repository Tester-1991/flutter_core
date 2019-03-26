import 'package:flutter_core/example/data/register.dart';
import 'package:json_annotation/json_annotation.dart';

part 'package:flutter_core/example/data/base_register.g.dart';
@JsonSerializable()
class RegisterBase {
  String errorMsg;

  int errorCode;

  Register data;

  RegisterBase(this.errorMsg, this.errorCode, this.data);

  factory RegisterBase.fromJson(Map<String, dynamic> json) => _$RegisterBaseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterBaseToJson(this);
}
