// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_workout.dart';

// **************************************************************************
// DataGenerator
// **************************************************************************

// ignore_for_file: unused_local_variable
// ignore_for_file: always_declare_return_types
class _$TrainingWorkoutRepository extends Repository<TrainingWorkout> {
  _$TrainingWorkoutRepository(LocalAdapter<TrainingWorkout> adapter,
      {bool remote, bool verbose})
      : super(adapter, remote: remote, verbose: verbose);

  @override
  get relationshipMetadata => {
        'HasMany': {'exercises': 'dynamics'},
        'BelongsTo': {'training': 'trainings', 'workout': 'dynamics'}
      };

  @override
  Repository repositoryFor(String type) {
    return <String, Repository>{
      'dynamics': manager.locator<Repository<dynamic>>(),
      'trainings': manager.locator<Repository<Training>>()
    }[type];
  }
}

class $TrainingWorkoutRepository extends _$TrainingWorkoutRepository
    with JSONAPIAdapter<TrainingWorkout>, JSONTrainAdapter<TrainingWorkout> {
  $TrainingWorkoutRepository(LocalAdapter<TrainingWorkout> adapter,
      {bool remote, bool verbose})
      : super(adapter, remote: remote, verbose: verbose);
}

// ignore: must_be_immutable, unused_local_variable
class $TrainingWorkoutLocalAdapter extends LocalAdapter<TrainingWorkout> {
  $TrainingWorkoutLocalAdapter(DataManager manager,
      {List<int> encryptionKey, box})
      : super(manager, encryptionKey: encryptionKey, box: box);

  @override
  deserialize(map) {
    map['exercises'] = {
      '_': [map['exercises'], manager]
    };
    map['training'] = {
      '_': [map['training'], manager]
    };
    map['workout'] = {
      '_': [map['workout'], manager]
    };
    return _$TrainingWorkoutFromJson(map);
  }

  @override
  serialize(model) {
    final map = _$TrainingWorkoutToJson(model);
    map['exercises'] = model.exercises?.toJson();
    map['training'] = model.training?.toJson();
    map['workout'] = model.workout?.toJson();
    return map;
  }

  @override
  setOwnerInRelationships(owner, model) {
    model.exercises?.owner = owner;
    model.training?.owner = owner;
    model.workout?.owner = owner;
  }

  @override
  void setInverseInModel(inverse, model) {
    if (inverse is DataId<dynamic>) {
      model.exercises?.inverse = inverse;
    }
    if (inverse is DataId<Training>) {
      model.training?.inverse = inverse;
    }
    if (inverse is DataId<dynamic>) {
      model.workout?.inverse = inverse;
    }
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingWorkout _$TrainingWorkoutFromJson(Map<String, dynamic> json) {
  return TrainingWorkout(
    id: json['id'] as int,
    training: json['training'] == null
        ? null
        : BelongsTo.fromJson(json['training'] as Map<String, dynamic>),
    workout: json['workout'] == null
        ? null
        : BelongsTo.fromJson(json['workout'] as Map<String, dynamic>),
    exercises: json['exercises'] == null
        ? null
        : HasMany.fromJson(json['exercises'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TrainingWorkoutToJson(TrainingWorkout instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exercises': instance.exercises,
      'workout': instance.workout,
      'training': instance.training,
    };
