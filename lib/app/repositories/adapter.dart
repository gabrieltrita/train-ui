import 'package:flutter_data/flutter_data.dart';

mixin JSONTrainAdapter<T extends DataSupport<T>> on Repository<T> {
  @override
  String get baseUrl => 'http://192.168.0.34:3000';
}
