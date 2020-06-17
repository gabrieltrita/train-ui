import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:train_ui/app/repositories/exercise.dart';

class ExerciseBloc extends BlocBase{
  final repository;
  ExerciseBloc(this.repository);

  DataStateNotifier<List<Exercise>> get responseOut => repository.watchAll();

  @override
  void dispose() {
    super.dispose();
  }
}