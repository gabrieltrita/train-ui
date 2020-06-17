import 'package:flutter_data/flutter_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:train_ui/app/repositories/exercise.dart';
import 'package:train_ui/app/repositories/training.dart';
import 'package:train_ui/app/repositories/workout.dart';

import 'adapter.dart';

part 'training_workout.g.dart';

@JsonSerializable()
@DataRepository([JSONAPIAdapter, JSONTrainAdapter])
class TrainingWorkout extends DataSupport<TrainingWorkout> {
  @override
  final int id;
  final HasMany<Exercise> exercises;
  final BelongsTo<Workout> workout;
  final BelongsTo<Training> training;

  TrainingWorkout({this.id, this.training, this.workout, this.exercises});
}
