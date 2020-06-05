import 'package:flutter/material.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:train_ui/app/repositories/training.dart';
import 'package:provider/provider.dart';

class AddTrainingPage extends StatefulWidget {
  @override
  _AddTrainingPageState createState() => _AddTrainingPageState();
}

class _AddTrainingPageState extends State<AddTrainingPage> {
  @override
  Widget build(BuildContext context) {
    final repository = context.watch<Repository<Training>>();
    return Container();
  }
}