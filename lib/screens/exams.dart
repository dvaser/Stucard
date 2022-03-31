import 'package:flutter/material.dart';
import 'package:stucard/template/screens.dart';

// ignore: use_key_in_widget_constructors
class Exams extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExamsState();
}

class _ExamsState extends State {
  @override
  Widget build(BuildContext context) {
    return Screens(ContentExams());
  }
}

// ignore: use_key_in_widget_constructors
class ContentExams extends StatefulWidget {
  @override
  State<ContentExams> createState() => _ContentExamsState();
}

class _ContentExamsState extends State<ContentExams> {
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
      child: Text("Sinavlar"),
    );
  }
}
