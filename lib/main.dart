import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:awsamplifydeneme/loading_view.dart';
import 'package:awsamplifydeneme/todo_cubit.dart';
import 'package:awsamplifydeneme/todos_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _amplifyConfigured = false;

  @override
  initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    //this is for  data storing
    await Amplify.addPlugin(
        AmplifyDataStore(modelProvider: ModelProvider.instance));

    // Once Plugins are added, configure Amplify
    try {
      await Amplify.configure(amplifyconfig);
    } catch (e) {
      print(e);
    }

    setState(() {
      _amplifyConfigured = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
          create: (context) => TodoCubit()..getTodos(),
          child: _amplifyConfigured ? TodosView() : LoadingView()),
    );
  }
}
