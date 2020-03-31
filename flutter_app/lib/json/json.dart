import "package:json_annotation/json_annotation.dart";

@JsonSerializable()
class Address {
  String street;
  String city;

  Address(this.street, this.city);
}