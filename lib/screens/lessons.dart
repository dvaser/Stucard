import 'package:flutter/material.dart';
import 'package:stucard/template/screens.dart';

// ignore: use_key_in_widget_constructors
class Lessons extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LessonsState();
}

class _LessonsState extends State {
  @override
  Widget build(BuildContext context) {
    return Screens(ContentLessons());
  }
}

// ignore: use_key_in_widget_constructors
class ContentLessons extends StatefulWidget {
  @override
  State<ContentLessons> createState() => _ContentLessonsState();
}

class _ContentLessonsState extends State<ContentLessons> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Scaffold(
      body: buildContent(),
      backgroundColor: Colors.green[100],
    );
  }

  Widget buildContent() {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Text("Dersler"),
    );
  }
}
