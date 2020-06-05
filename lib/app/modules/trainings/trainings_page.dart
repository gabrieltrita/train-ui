import 'package:flutter/cupertino.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:flutter_data_state/flutter_data_state.dart';
import 'package:train_ui/app/repositories/training.dart';
import 'package:provider/provider.dart';

class TrainingPage extends StatefulWidget {
  @override
  _TrainingPageState createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('List Trainings'),
        trailing: GestureDetector(
          onTap: () => print('cliquei no edit'),
          child: Text('Edit', style: TextStyle(color: CupertinoColors.activeBlue) ),
        ),
      ),
      child: Builder(
      builder: (context) {
        if (context.watch<DataManager>() == null) {
          print('aaaa');
          return const CupertinoActivityIndicator();
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[TrainingScreen(), AddTrainingButtomBar()],
        );
      },
    ));
  }
}

class TrainingScreen extends StatefulWidget {
  @override
  _TrainingScreenState createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  @override
  Widget build(BuildContext context) {
    final repository = context.watch<Repository<Training>>();
    return DataStateBuilder(
      notifier: repository.watchAll(),
      builder: (context, state, snapshot, _) {
       if (state.isLoading) {
          return Center(child: const CupertinoActivityIndicator());
        }
        return SizedBox(
            height: 700.0,
            child: new ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (content, i) {
                final training = state.model[i];
                print(training.name);
                return ItemTraining(training);
              },
              itemCount: state.model.length
            )
        );
      },
    );
  }
}

class ItemTraining extends StatelessWidget {
  final Training training;
  ItemTraining(this.training);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(training.name, style: TextStyle(color: CupertinoColors.activeBlue,fontSize: 22)),
        Container(
          alignment: Alignment.centerRight,
          margin: EdgeInsets.only(right: 10.0),
          child: Icon(CupertinoIcons.right_chevron)),
      ],
    );
  }
}

class AddTrainingButtomBar extends StatelessWidget {
  final myController = TextEditingController();

  void addTraining(context) {
    Training train = Training(name: myController.text);
    train.save();
    Navigator.of(context, rootNavigator: true).pop();
  }

  Future<Column> showDialogAddTraining(context) {
    return showCupertinoDialog(context: context, builder: (_) => CupertinoAlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('New Training', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          Text('Enter a name for the workout.'),
          CupertinoTextField(placeholder: 'Name', controller: myController,),
        ],
      ),
      actions: <Widget> [
        CupertinoDialogAction(child: const Text('Save'), isDefaultAction: true, onPressed: () => {  }),
        CupertinoDialogAction(child: const Text('Cancel'), isDestructiveAction: true, onPressed: () => Navigator.of(context, rootNavigator: true).pop()),
      ],
    ));
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(right: 10.0),
      child: GestureDetector(
        onTap: () => showDialogAddTraining(context),
        child: Text('Add Training', style: TextStyle(color: CupertinoColors.activeBlue, fontSize: 22), ),
      )
    );

  }
}