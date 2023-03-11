import 'package:hive_flutter/hive_flutter.dart';

class ClearStorage {
  final Box _localStorage = Hive.box("productive_storage");
  void clearStorage() {
    _localStorage.clear();
  }
}
