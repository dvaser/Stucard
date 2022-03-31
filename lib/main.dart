// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stucard/screens/exams.dart';
import 'package:stucard/screens/info.dart';
import 'package:stucard/screens/lessons.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: const BuildProfile(),
          ),
        ),
      body: Container(
        child: buildBody(context),
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(top: 50.0),
      ),
      backgroundColor: Colors.green[100],
    );
  }

  Widget buildBody(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      child: Column(
        children: [
          Row(children: [
            BuildButton(context, MyApp(), "ANA SAYFA"),
            BuildButton(context, Info(), "ÖĞRENCİ"),
          ]),
          Row(children: [
            BuildButton(context, Lessons(), "DERSLER"),
            BuildButton(context, Exams(), "SINAVLAR"),
          ]),
          Row(children: [
            BuildButtonExit(context, "ÇIKIŞ"),
          ])
        ],
      ),
      width: 380,
    );
  }

  // ignore: deprecated_member_use
  Widget BuildButton(BuildContext context, Widget Screen, String text) =>
      Container(
        width: 150.0,
        height: 130.0,
        // ignore: deprecated_member_use
        margin: const EdgeInsets.all(20.0),
        // ignore: deprecated_member_use
        child: RaisedButton(
            color: Colors.amberAccent,
            child: Center(
              child: Text(text,
                  style: const TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.bold)),
            ),
            textColor: Colors.black,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Screen));
            }),
      );

  Widget BuildButtonExit(BuildContext context, String text) =>
      Container(
        width: 150.0,
        height: 130.0,
        // ignore: deprecated_member_use
        margin: const EdgeInsets.all(20.0),
        // ignore: deprecated_member_use
        child: RaisedButton(
            color: Colors.amberAccent,
            child: Center(
              child: Text(text,
                  style: const TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.bold)),
            ),
            textColor: Colors.black,
            onPressed: () {
              exit(0);
            }),
      );
}
