// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// DataGenerator
// **************************************************************************

// ignore_for_file: unused_local_variable
// ignore_for_file: always_declare_return_types
class _$ExerciseRepository extends Repository<Exercise> {
  _$ExerciseRepository(LocalAdapter<Exercise> adapter,
      {bool remote, bool verbose})
      : super(adapter, remote: remote, verbose: verbose);

  @override
  get relationshipMetadata => {
        'HasMany': {'trainingWorkout': 'trainingworkouts'},
        'BelongsTo': {}
      };

  @override
  Repository repositoryFor(String type) {
    return <String, Repository>{
      'trainingworkouts': manager.locator<Repository<TrainingWorkout>>()
    }[type];
  }
}

class $ExerciseRepository extends _$ExerciseRepository
    with JSONAPIAdapter<Exercise>, JSONTrainAdapter<Exercise> {
  $ExerciseRepository(LocalAdapter<Exercise> adapter,
      {bool remote, bool verbose})
      : super(adapter, remote: remote, verbose: verbose);
}

// ignore: must_be_immutable, unused_local_variable
class $ExerciseLocalAdapter extends LocalAdapter<Exercise> {
  $ExerciseLocalAdapter(DataManager manager, {List<int> encryptionKey, box})
      : super(manager, encryptionKey: encryptionKey, box: box);

  @override
  deserialize(map) {
    map['trainingWorkout'] = {
      '_': [map['trainingWorkout'], manager]
    };
    return _$ExerciseFromJson(map);
  }

  @override
  serialize(model) {
    final map = _$ExerciseToJson(model);
    map['trainingWorkout'] = model.trainingWorkout?.toJson();
    return map;
  }

  @override
  setOwnerInRelationships(owner, model) {
    model.trainingWorkout?.owner = owner;
  }

  @override
  void setInverseInModel(inverse, model) {
    if (inverse is DataId<TrainingWorkout>) {
      model.trainingWorkout?.inverse = inverse;
    }
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) {
  return Exercise(
    id: json['id'] as int,
    trainingWorkout: json['trainingWorkout'] == null
        ? null
        : HasMany.fromJson(json['trainingWorkout'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'id': instance.id,
      'trainingWorkout': instance.trainingWorkout,
    };
