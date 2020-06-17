// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.dart';

// **************************************************************************
// DataGenerator
// **************************************************************************

// ignore_for_file: unused_local_variable
// ignore_for_file: always_declare_return_types
class _$WorkoutRepository extends Repository<Workout> {
  _$WorkoutRepository(LocalAdapter<Workout> adapter,
      {bool remote, bool verbose})
      : super(adapter, remote: remote, verbose: verbose);

  @override
  get relationshipMetadata => {
        'HasMany': {},
        'BelongsTo': {'trainingWorkout': 'trainingworkouts'}
      };

  @override
  Repository repositoryFor(String type) {
    return <String, Repository>{
      'trainingworkouts': manager.locator<Repository<TrainingWorkout>>()
    }[type];
  }
}

class $WorkoutRepository extends _$WorkoutRepository
    with JSONAPIAdapter<Workout>, JSONTrainAdapter<Workout> {
  $WorkoutRepository(LocalAdapter<Workout> adapter, {bool remote, bool verbose})
      : super(adapter, remote: remote, verbose: verbose);
}

// ignore: must_be_immutable, unused_local_variable
class $WorkoutLocalAdapter extends LocalAdapter<Workout> {
  $WorkoutLocalAdapter(DataManager manager, {List<int> encryptionKey, box})
      : super(manager, encryptionKey: encryptionKey, box: box);

  @override
  deserialize(map) {
    map['trainingWorkout'] = {
      '_': [map['trainingWorkout'], manager]
    };
    return _$WorkoutFromJson(map);
  }

  @override
  serialize(model) {
    final map = _$WorkoutToJson(model);
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

Workout _$WorkoutFromJson(Map<String, dynamic> json) {
  return Workout(
    id: json['id'] as int,
    trainingWorkout: json['trainingWorkout'] == null
        ? null
        : BelongsTo.fromJson(json['trainingWorkout'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WorkoutToJson(Workout instance) => <String, dynamic>{
      'id': instance.id,
      'trainingWorkout': instance.trainingWorkout,
    };
