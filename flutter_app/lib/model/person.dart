/// name : "wangbin"
/// age : 18

class Person {
  Person({
      String? name,
      int? age,}){
    _name = name;
    _age = age;
}

  Person.fromJson(dynamic json) {
    _name = json['name'];
    _age = json['age'];
  }
  String? _name;
  int? _age;

  String? get name => _name;
  int? get age => _age;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['age'] = _age;
    return map;
  }

}