import 'package:flutter_data/flutter_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:train_ui/app/repositories/training_workout.dart';

import 'adapter.dart';

part 'workout.g.dart';

@JsonSerializable()
@DataRepository([JSONAPIAdapter, JSONTrainAdapter])
class Workout extends DataSupport<Workout> {
  @override
  final int id;
  final BelongsTo<TrainingWorkout> trainingWorkout;

  Workout({this.id, this.trainingWorkout});
}
