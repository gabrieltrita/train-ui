// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training.dart';

// **************************************************************************
// DataGenerator
// **************************************************************************

// ignore_for_file: unused_local_variable
// ignore_for_file: always_declare_return_types
class _$TrainingRepository extends Repository<Training> {
  _$TrainingRepository(LocalAdapter<Training> adapter,
      {bool remote, bool verbose})
      : super(adapter, remote: remote, verbose: verbose);

  @override
  get relationshipMetadata => {'HasMany': {}, 'BelongsTo': {}};

  @override
  Repository repositoryFor(String type) {
    return <String, Repository>{}[type];
  }
}

class $TrainingRepository extends _$TrainingRepository
    with JSONAPIAdapter<Training>, JSONTrainAdapter<Training> {
  $TrainingRepository(LocalAdapter<Training> adapter,
      {bool remote, bool verbose})
      : super(adapter, remote: remote, verbose: verbose);
}

// ignore: must_be_immutable, unused_local_variable
class $TrainingLocalAdapter extends LocalAdapter<Training> {
  $TrainingLocalAdapter(DataManager manager, {List<int> encryptionKey, box})
      : super(manager, encryptionKey: encryptionKey, box: box);

  @override
  deserialize(map) {
    return _$TrainingFromJson(map);
  }

  @override
  serialize(model) {
    final map = _$TrainingToJson(model);

    return map;
  }

  @override
  setOwnerInRelationships(owner, model) {}

  @override
  void setInverseInModel(inverse, model) {}
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Training _$TrainingFromJson(Map<String, dynamic> json) {
  var id = int.parse(json['id']);
  return Training(
    id: id,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$TrainingToJson(Training instance) => <String, dynamic>{
      if (instance.id != null) 'id': instance.id,
      'name': instance.name,
    };
