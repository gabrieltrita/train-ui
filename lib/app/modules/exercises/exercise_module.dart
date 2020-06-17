import 'package:flutter_data/flutter_data.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:train_ui/app/modules/exercises/exercise_bloc.dart';
import 'package:train_ui/app/modules/exercises/exercise_page.dart';
import 'package:train_ui/app/repositories/exercise.dart';
class ExerciseModule extends ChildModule {
  final locator;
  ExerciseModule(this.locator);

  @override
  List<Bind> get binds => [
    Bind((i) => ExerciseBloc(RepositoryIntermediario(locator<Repository<Exercise>>()).repositoryExercise)),
  ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ExercisePage(training: args.data)),
      ];

  static Inject get to => Inject<ExerciseModule>.of();
}


class RepositoryIntermediario {
  final repositoryExercise;

  RepositoryIntermediario(this.repositoryExercise);
}