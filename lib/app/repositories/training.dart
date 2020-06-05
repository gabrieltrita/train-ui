import 'package:flutter_data/flutter_data.dart';
import 'package:json_annotation/json_annotation.dart';

import 'adapter.dart';

part 'training.g.dart';

@JsonSerializable()
@DataRepository([JSONAPIAdapter, JSONTrainAdapter])
class Training extends DataSupport<Training> {
  @override
  final int id;
  final String name;

  Training({this.id, this.name});
}
