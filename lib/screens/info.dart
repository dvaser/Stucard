// ignore_for_file: prefer_typing_uninitialized_variables, prefer_initializing_formals

import 'package:flutter/material.dart';
import 'package:stucard/models/student.dart';
import 'package:stucard/screens/studentUpdate.dart';
import 'package:stucard/template/screens.dart';

// ignore: use_key_in_widget_constructors
class Info extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InfoState();
}

class _InfoState extends State {
  @override
  Widget build(BuildContext context) {
    return Screens(ContentInfo());
  }
}

// ignore: use_key_in_widget_constructors
class ContentInfo extends StatefulWidget {
  @override
  State<ContentInfo> createState() => _ContentInfoState();
}

class _ContentInfoState extends State<ContentInfo> {
  var student = Student("photo", "Doğukan", "Vatansever", "Bursa Uludağ Üniversitesi", "Bursa", "07.09.2001");
  List<Student> students = [];

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Scaffold(
        body: Container(
          child: buildContent(),
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.only(top: 50.0),
        ),
        backgroundColor: Colors.green[100],
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal[900],
          tooltip: 'Increment',
          onPressed: () {
            Navigator.push(
                  context, MaterialPageRoute(builder: (context) => StudentUpdate(students)));
          },
          child: const Icon(Icons.update),
        ));
  }

  Widget buildContent() {
    // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
    return Container(
        width: 380,
        child: Column(
          children: [
            Row(children: [
              buildList("PROFİL:"),
              // ignore: prefer_const_constructors
              Text("     "),
              // ignore: prefer_const_constructors
              BuildProfile()
            ]),
            Row(children: [buildList("ADI:"), buildList(student.firstName)]),
            Row(children: [buildList("SOYADI:"), buildList(student.lastName)]),
            Row(children: [
              buildList("OKUL:"),
              buildList(student.school)
            ]),
            Row(children: [buildList("ŞEHİR:"), buildList(student.city)]),
            Row(children: [
              buildList("DOĞUM TARİHİ:"),
              buildList(student.birthday)
            ]),
          ],
        ));
  }

  Widget buildList(String value) {
    return Container(
        margin: const EdgeInsets.only(left: 20, top: 10),
        width: 100,
        height: 70,
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(value,
                style: const TextStyle(
                    fontSize: 15.0, fontWeight: FontWeight.bold))
          ],
        ));
  }
}

class BuildProfile extends StatelessWidget {
  const BuildProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"))
        ],
      ));
}
