// ignore_for_file: unused_import, non_constant_identifier_names, unrelated_type_equality_checks
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stucard/screens/exams.dart';
import 'package:stucard/screens/info.dart';
import 'package:stucard/screens/lessons.dart';

import '../main.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class Screens extends StatefulWidget {
  Widget ScreenContents = Container();

  // ignore: use_key_in_widget_constructors
  Screens(Widget ScreenContent) {
    // ignore: unnecessary_this
    this.ScreenContents = ScreenContent;
  }
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _ScreensState(ScreenContents);
}

// ignore: must_be_immutable
class _ScreensState extends State {
  Widget ScreenContents = Container();

  _ScreensState(Widget ScreenContent) {
    // ignore: prefer_initializing_formals, unnecessary_this
    this.ScreenContents = ScreenContent;
  }
  String appTitle = "STUCARD";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: deprecated_member_use
        title: Text(appTitle),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal[900],
        // ignore: prefer_const_constructors
        leading:
            Padding(padding: const EdgeInsets.all(8.0), child: BuildProfile()),
      ),
      body: buildBody(context),
      backgroundColor: Colors.green[100],
    );
  }

  Widget buildBody(BuildContext context) {
    return Row(children: [
      Flexible(
          fit: FlexFit.tight,
          flex: 2,
          child: Container(
              color: Colors.teal[400],
              child: Center(
                child: Column(children: [
                  BuildButton(context, MyApp(),
                      const Icon(Icons.home, color: Colors.blue)),
                  BuildButton(context, Info(),
                      const Icon(Icons.face, color: Colors.red)),
                  BuildButton(context, Lessons(),
                      const Icon(Icons.segment, color: Colors.purple)),
                  BuildButton(context, Exams(),
                      const Icon(Icons.leaderboard, color: Colors.green)),
                  BuildButtonExit(context, const Icon(Icons.exit_to_app, color: Colors.black))
                ]),
              ))),
      Flexible(
          fit: FlexFit.tight,
          flex: 8,
          child: Container(
              color: Colors.green[100],
              // ignore: avoid_unnecessary_containers
              child: Container(
                child: BuildContent(context, ScreenContents),
              )))
    ]);
  }

  // ignore: deprecated_member_use
  Widget BuildButton(BuildContext context, Widget Screen, Widget icon) =>
      Container(
        // ignore: deprecated_member_use
        margin: const EdgeInsets.all(10.0),
        // ignore: deprecated_member_use
        child: RaisedButton(
            color: Colors.amberAccent,
            child: icon,
            textColor: Colors.black,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Screen));
            }),
      );

  Widget BuildButtonExit(BuildContext context, Widget icon) => Container(
        // ignore: deprecated_member_use
        margin: const EdgeInsets.all(10.0),
        // ignore: deprecated_member_use
        child: RaisedButton(
            color: Colors.amberAccent,
            child: icon,
            textColor: Colors.black,
            onPressed: () {
              exit(0);
            }),
      );

  Widget BuildContent(BuildContext context, Widget Screen) =>
      Container(child: Screen);
}
