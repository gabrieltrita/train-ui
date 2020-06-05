import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:train_ui/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:train_ui/main.data.dart';

void main() => runApp(MultiProvider(providers: [
  ...dataProviders(() => getApplicationDocumentsDirectory(), clear: true),
], child: ModularApp(module: AppModule())));
