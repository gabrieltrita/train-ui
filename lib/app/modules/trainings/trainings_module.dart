import 'package:flutter_data/flutter_data.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:train_ui/app/modules/exercises/exercise_module.dart';
import 'package:train_ui/app/modules/exercises/exercise_page.dart';
import 'package:train_ui/app/modules/trainings/trainings_bloc.dart';
import 'package:train_ui/app/modules/trainings/trainings_page.dart';
import 'package:train_ui/app/repositories/training.dart';
class TraninigModule extends ChildModule {
  final locator;
  TraninigModule(this.locator);

  @override
  List<Bind> get binds => [
    Bind((i) => TrainingBloc(RepositoryIntermediario(locator<Repository<Training>>()).repositoryTraining)),
  ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => TrainingPage()),
        Router('/workout',  module: ExerciseModule(locator)),
      ];

  static Inject get to => Inject<TraninigModule>.of();
}


class RepositoryIntermediario {
  final repositoryTraining;

  RepositoryIntermediario(this.repositoryTraining);
}