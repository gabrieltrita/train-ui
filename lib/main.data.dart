

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: directives_ordering

import 'dart:io';
import 'package:flutter_data/flutter_data.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:train_ui/app/repositories/training.dart';

extension FlutterData on DataManager {

  static Future<DataManager> init(Directory baseDir, {bool autoModelInit = true, bool clear, bool remote, bool verbose, List<int> encryptionKey, Function(void Function<R>(R)) also}) async {
    assert(baseDir != null);

    final injection = DataServiceLocator();

    final manager = await DataManager(autoModelInit: autoModelInit).init(baseDir, injection.locator, clear: clear, verbose: verbose);
    injection.register(manager);
    final trainingLocalAdapter = await $TrainingLocalAdapter(manager, encryptionKey: encryptionKey).init();
    injection.register(trainingLocalAdapter);
    injection.register<Repository<Training>>($TrainingRepository(trainingLocalAdapter, remote: remote, verbose: verbose));


    if (also != null) {
      // ignore: unnecessary_lambdas
      also(<R>(R obj) => injection.register<R>(obj));
    }

    return manager;

}

  List<SingleChildWidget> get providers {
  return [
    Provider<Repository<Training>>.value(value: locator<Repository<Training>>()),
  ];
}

  
}



List<SingleChildWidget> dataProviders(Future<Directory> Function() directory, {bool clear, bool remote, bool verbose, List<int> encryptionKey}) => [
  FutureProvider<DataManager>(
    create: (_) => directory().then((dir) {
          return FlutterData.init(dir, clear: clear, remote: remote, verbose: verbose, encryptionKey: encryptionKey);
        })),


    ProxyProvider<DataManager, Repository<Training>>(
      lazy: false,
      update: (_, m, __) => m?.locator<Repository<Training>>(),
    ),];
