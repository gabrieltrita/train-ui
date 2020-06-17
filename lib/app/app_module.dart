import 'package:flutter_data/flutter_data.dart';
import 'package:train_ui/app/app_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:train_ui/app/app_widget.dart';
import 'package:train_ui/app/modules/trainings/trainings_module.dart';

class AppModule extends MainModule {
  final Locator locator;
  AppModule(this.locator);

  @override
  List<Bind> get binds => [
        Bind((i) => AppBloc()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: TraninigModule(locator)),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
