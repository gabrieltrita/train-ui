import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Training App',
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
