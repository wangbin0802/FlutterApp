import 'dart:collection';

class Team {
  var _people = <Person>{};

  UnmodifiableSetView<Person> get people => UnmodifiableSetView(_people);
}

class Person {
  var name;
  var age;
  var favoriteColor;
}