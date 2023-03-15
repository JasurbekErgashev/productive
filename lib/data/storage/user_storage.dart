import 'package:hive_flutter/hive_flutter.dart';
import 'package:productive/data/dto/user.dart';

const _userDetailsKey = 'user_details';
const _isFirstTime = 'is_first_time';

class UserStorage {
  final Box _userStorage = Hive.box("productive_storage");

  User? get user => _userStorage.get(_userDetailsKey);
  bool get isFirstTime => _userStorage.get(_isFirstTime) ?? true;

  Future<void> saveUser(User user) async {
    await _userStorage.put(_userDetailsKey, user);
  }

  Future<void> saveIsFirstTime() async {
    await _userStorage.put(_isFirstTime, false);
  }

  void clearStorage() {
    _userStorage.clear();
  }
}
