import 'package:flutter/cupertino.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:flutter_data_state/flutter_data_state.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:train_ui/app/modules/trainings/trainings_bloc.dart';
import 'package:train_ui/app/modules/trainings/trainings_module.dart';
import 'package:train_ui/app/repositories/training.dart';

class TrainingPage extends StatefulWidget {
  @override
  _TrainingPageState createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  bool isEditing = false;
  String labelEdit = 'Edit';
  var bloc = TraninigModule.to.get<TrainingBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('List Trainings'),
        trailing: GestureDetector(
          onTap: () => {
            setState(() {
              if (isEditing) {
                isEditing = false;
                labelEdit = 'Edit';
              } else {
                isEditing = true;
                labelEdit = 'OK';
              }
            })
          },
          child: Text(labelEdit, style: TextStyle(color: CupertinoColors.activeBlue) ),
        ),
      ),
      child: Builder(
      builder: (context) {
        if (bloc.repository == null) {

          return const CupertinoActivityIndicator();
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[TrainingScreen(isEditing), AddTrainingButtomBar(isEditing)],
        );
      },
    ));
  }
}

class TrainingScreen extends StatelessWidget {
  final bool isEditing;
  final TrainingBloc bloc = TraninigModule.to.get<TrainingBloc>();

  TrainingScreen(this.isEditing);

  @override
  Widget build(BuildContext context) {
    return DataStateBuilder(
      notifier: bloc.responseOut,
      builder: (context, state, snapshot, _) {
       if ((state.isLoading && state.model.length != 0) || state.model.length == 0) {
          print(state);
          return Center(
            heightFactor: 40.0,
            child: const CupertinoActivityIndicator());
        }
        return SizedBox(
            height: 700.0,
            child: new ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (content, i) {
                final training = state.model[i];
                print(training.name);
                return ItemTraining(training, isEditing);
              },
              itemCount: state.model.length
            )
        );
      },
    );
  }
}

class ItemTraining extends StatelessWidget {
  final TrainingBloc bloc = TraninigModule.to.get<TrainingBloc>();
  final Training training;
  final bool isEditing;
  ItemTraining(this.training, this.isEditing);

  Future<CupertinoActionSheet> removeItem(BuildContext context, Training training) {
    return showCupertinoModalPopup(context: context, builder: (context) => CupertinoActionSheet(
      actions: <Widget>[
        CupertinoActionSheetAction(
          child : Text('Delete Training ${training.name}', style: TextStyle(color: CupertinoColors.destructiveRed)),
          onPressed: () async {
            bloc.delete(training);
            Navigator.of(context, rootNavigator: true).pop();
          },
        ),

        CupertinoActionSheetAction(
          child : Text('Cancel'),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        ),
      ]));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () => { Modular.to.pushNamed('/workout', arguments: training) },
          child: Text(training.name, style: TextStyle(color: CupertinoColors.activeBlue,fontSize: 22))),
        Expanded(child: Container(
          alignment: Alignment.centerRight,
          margin: EdgeInsets.only(right: 10.0),
          child: Row(mainAxisSize: MainAxisSize.min, children: [(isEditing) ? GestureDetector(
            onTap: () => { removeItem(context, training) },
            child:  Icon(CupertinoIcons.delete)) : Icon(CupertinoIcons.right_chevron)]))),
      ],
    );
  }
}

class AddTrainingButtomBar extends StatelessWidget {
  final TrainingBloc bloc = TraninigModule.to.get<TrainingBloc>();
  final myController = TextEditingController();
  final bool isEditing;

  AddTrainingButtomBar(this.isEditing);

  void addTraining(context) {
    Training train = Training(name: myController.text);
    train.save();
    Navigator.of(context, rootNavigator: true).pop();
    myController.clear();
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
        CupertinoDialogAction(child: const Text('Save'), isDefaultAction: true, onPressed: () => {
          bloc.add(myController.text).whenComplete(Navigator.of(context, rootNavigator: true).pop())
        }),
        CupertinoDialogAction(child: const Text('Cancel'), isDestructiveAction: true, onPressed: () => Navigator.of(context, rootNavigator: true).pop()),
      ],
    ));
  }


  @override
  Widget build(BuildContext context) {
    CupertinoDynamicColor color = (!isEditing) ? CupertinoColors.activeBlue : CupertinoColors.inactiveGray;
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(right: 10.0),
      child: GestureDetector(
        onTap: () => { if (!isEditing) showDialogAddTraining(context) },
        child: Text('Add Training', style: TextStyle(color: color, fontSize: 22), ),
      )
    );

  }
}