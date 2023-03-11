import 'package:hive_flutter/hive_flutter.dart';
import 'package:productive/data/dto/user.dart';

const _userDetailsKey = 'user_details';

class UserStorage {
  final Box _userStorage = Hive.box("ais_storage");

  User? get user => _userStorage.get(_userDetailsKey);

  Future<void> saveUser(User user) async {
    await _userStorage.put(_userDetailsKey, user);
  }
}
