import 'package:flutter/material.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:train_ui/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:train_ui/main.data.dart';

// void main() => runApp(ModularApp(module: AppModule()));
void main() async {
  runApp(Center(child: const CircularProgressIndicator()));
  final baseDir = await getApplicationDocumentsDirectory();
  final manager = await FlutterData.init(baseDir);
  Locator locator = manager.locator;

  runApp(ModularApp(module: AppModule(locator),isCupertino: true));
}
