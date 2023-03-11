import 'package:hive_flutter/hive_flutter.dart';
import 'package:productive/data/dto/user.dart';

class StorageModule {
  Future<Box> createHive() async {
    Hive.registerAdapter(UserAdapter());
    return await Hive.openBox('productive_storage');
  }
}
