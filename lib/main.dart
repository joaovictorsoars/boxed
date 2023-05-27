import 'package:boxed/src/core/constants/storage_keys.dart';
import 'package:boxed/src/core/instances.dart';
import 'package:boxed/src/logic/cubits/correios/token_correios_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Instances.instantiate();

  var storage = Instances.it.get<FlutterSecureStorage>();
  var isGettingStarted =
      await storage.read(key: StorageKeys.isGettingStarted) == 'true';

  var tokenCorreiosCubit = Instances.it.get<TokenCorreiosCubit>();
  await tokenCorreiosCubit.saveToken();

  runApp(MyApp(isGettingStarted));
}
