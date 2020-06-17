import 'package:flutter_data/flutter_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:train_ui/app/repositories/training_workout.dart';

import 'adapter.dart';

part 'exercise.g.dart';

@JsonSerializable()
@DataRepository([JSONAPIAdapter, JSONTrainAdapter])
class Exercise extends DataSupport<Exercise> {
  @override
  final int id;
  final HasMany<TrainingWorkout> trainingWorkout;

  Exercise({this.id, this.trainingWorkout});
}
