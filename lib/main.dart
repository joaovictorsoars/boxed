import 'package:boxed/src/core/constants/storage_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const storage = FlutterSecureStorage();
  var isNotGettingStarted =
      await storage.read(key: StorageKeys.isNotGettingStarted) == 'true';

  runApp(MyApp(
    isNotGettingStarted: isNotGettingStarted,
  ));
}
