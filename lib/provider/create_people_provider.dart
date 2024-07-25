import 'package:flutter/foundation.dart';

class PeopleProvider with ChangeNotifier {
  List<Map<String, String>> _people = [];

  List<Map<String, String>> get people => _people;

  void addPerson(String id, String name) {
    _people.add({'id': id, 'name': name});
    notifyListeners();
  }
}
