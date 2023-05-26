import 'package:boxed/src/core/routes.dart';
import 'package:boxed/src/presentation/themes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      textDirection: TextDirection.ltr,
      children: [
        MaterialApp(
          onGenerateRoute: Routes.onGenerateRoute,
          initialRoute: Routes.gettingStarted,
          theme: BoxedThemes.lightTheme,
        )
      ],
    );
  }
}
