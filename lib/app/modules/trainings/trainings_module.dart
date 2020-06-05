import 'package:flutter_modular/flutter_modular.dart';
import 'package:train_ui/app/modules/trainings/add/add_training_bloc.dart';
import 'package:train_ui/app/modules/trainings/add/add_training_page.dart';
import 'package:train_ui/app/modules/trainings/trainings_bloc.dart';
import 'package:train_ui/app/modules/trainings/trainings_page.dart';

class TraninigModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TrainingBloc()),
        Bind((i) => AddTrainingBloc()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => TrainingPage()),
        Router('/add', child: (_, args) => AddTrainingPage()),
      ];

  static Inject get to => Inject<TraninigModule>.of();
}
