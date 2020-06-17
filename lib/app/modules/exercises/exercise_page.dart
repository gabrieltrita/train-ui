import 'package:flutter/cupertino.dart';
import 'package:flutter_data_state/flutter_data_state.dart';
import 'package:train_ui/app/modules/exercises/exercise_bloc.dart';
import 'package:train_ui/app/modules/exercises/exercise_module.dart';
import 'package:train_ui/app/repositories/training.dart';

class ExercisePage extends StatelessWidget {
  final Training training;
  final ExerciseBloc exerciseBloc = ExerciseModule.to.get<ExerciseBloc>();
  ExercisePage({this.training});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
         middle: Text('List Exercises - ${training.name}'),
         automaticallyImplyLeading: true,
      ),
      child: Builder(builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoTextField(),
            Text('${exerciseBloc.responseOut.state.model.length} exercises'),
            DataStateBuilder(
              notifier: exerciseBloc.responseOut,
              builder: (context, state, snapshot, _) {
                return SizedBox(
                  height: 700.0,
                  child: new ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (content, i) {
                      final exercise = state.model[i];
                      print(exercise.name);
                      return Center();
                    },
                    itemCount: state.model.length,
                  )
                );
              },
            )
            //CupertinoButton(child: null, onPressed: null)
          ],
        );
      }),
    );
  }
}