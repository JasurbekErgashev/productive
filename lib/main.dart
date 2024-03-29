import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:productive/app.dart';
import 'package:productive/data/storage/storage_module.dart';
import 'package:productive/firebase_options.dart';
import 'package:productive/shared/bloc_observer.dart';

// Dio & Retrofit
// get_it & injectable

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Hive.initFlutter();
  await StorageModule().createHive();
  runApp(
    const Productive(),
  );
}
