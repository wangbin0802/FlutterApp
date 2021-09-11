import "package:json_annotation/json_annotation.dart";
part 'address.g.dart';

@JsonSerializable()
class Address {
  String street;
  String city;

  Address(this.street, this.city);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}