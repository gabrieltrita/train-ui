import 'package:flutter_data/flutter_data.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:train_ui/app/repositories/training.dart';

class TrainingBloc extends Disposable {
  TrainingBloc();

  Future<Training> addTraining(String name) async {
    try {
      Training train = Training(name: name);
      return await train.save();
    } catch (err) {
      throw(err);
    }
  }


  @override
  void dispose() {}
}
