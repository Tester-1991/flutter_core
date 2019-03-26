import 'package:json_annotation/json_annotation.dart';

part 'package:flutter_core/example/data/register.g.dart';

@JsonSerializable()
class Register {
  int id;

  String username;

  Register(this.id, this.username);

  factory Register.fromJson(Map<String, dynamic> json) =>
      _$RegisterFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterToJson(this);
}
