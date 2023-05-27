import 'package:boxed/src/core/routes.dart';
import 'package:boxed/src/presentation/themes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final bool isGettingStarted;

  const MyApp(this.isGettingStarted);

  @override
  Widget build(BuildContext context) {
    return Stack(
      textDirection: TextDirection.ltr,
      children: [
        MaterialApp(
          onGenerateRoute: Routes.onGenerateRoute,
          initialRoute: !isGettingStarted ? Routes.gettingStarted : Routes.home,
          theme: BoxedThemes.lightTheme,
        )
      ],
    );
  }
}
