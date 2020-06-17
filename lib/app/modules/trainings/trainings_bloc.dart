import 'package:flutter_data/flutter_data.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:train_ui/app/repositories/training.dart';

class TrainingBloc extends BlocBase {
  final repository;
  TrainingBloc(this.repository);

  DataStateNotifier<List<Training>> get responseOut => repository.watchAll();

   add(String name) async {
    try {
      Training train = Training(name: name);
      return await train.save();
    } catch (err) {
      print(err.toString());
    }
  }

  delete(Training training) async {
    try {
      return await training.delete();
     } catch (err) {
      print(err.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
