// ignore_for_file: file_names, must_be_immutable, no_logic_in_create_state, prefer_initializing_formals

import 'package:stucard/models/student.dart';
import 'package:stucard/validation/studentValidator.dart';
import 'package:flutter/material.dart';

void sendMessage(BuildContext context, String alertMessage, String message) {
  // ignore: unused_local_variable
  var alert = AlertDialog(
    title: Text(alertMessage),
    content: Text(message),
  );
  showDialog(context: context, builder: (BuildContext context) => alert);
}

class StudentUpdate extends StatefulWidget {
  List<Student> students = [];
  // ignore: use_key_in_widget_constructors
  StudentUpdate(List<Student> students) {
    this.students = students;
  }
  @override
  State<StatefulWidget> createState() => _StudentUpdateState(students);
}

class _StudentUpdateState extends State with StudentValidationMixin {
  List<Student> students = []; // ignore: use_key_in_widget_constructors
  _StudentUpdateState(List<Student> students) {
    this.students = students;
  }
  String titleBar = "ÖĞRENCİ BİLGİLERİ";
  var student = Student.withoutInfo();
  var formKey = GlobalKey<FormState>();
  String studentAddMassage = "";

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(titleBar),
          centerTitle: true,
          foregroundColor: Colors.white,
          backgroundColor: Colors.teal[900],
        ),
        body: Container(
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  buildFirstNameField(),
                  buildLastNameField(),
                  buildSchoolField(),
                  buildCityField(),
                  buildBirthdayField(),
                  buildSumbitButton(),
                ],
              )),
        ),
        backgroundColor: Colors.green[100],
      );

  Widget buildFirstNameField() {
    return TextFormField(
      decoration:
          const InputDecoration(labelText: "ÖĞRENCİNİN ADI", hintText: "Adı Giriniz"),
      validator: (value) {
        if (validateFirstName(value!)) {
          return null;
        } else {
          return "Adınız en az 3 karakter olmalıdır.";
        }
      },
      onSaved: (var value) => student.firstName = value,
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: "ÖĞRENCİNİN SOYADI", hintText: "Soyadı Giriniz"),
      validator: (value) {
        if (validateLastName(value!)) {
          return null;
        } else {
          return "Soyadınız en az 2 karakter olmalıdır.";
        }
      },
      onSaved: (var value) => student.lastName = value,
    );
  }

  Widget buildSchoolField() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: "ÖĞRENCİNİN OKULU", hintText: "Okul Giriniz"),
      validator: (value) {
        if (validateSchool(value!)) {
          return null;
        } else {
          return "Okul adınız en az 8 karakter olmalıdır.";
        }
      },
      onSaved: (var value) => student.lastName = value,
    );
  }

  Widget buildCityField() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: "ÖĞRENCİNİN YAŞADIĞI ŞEHİR", hintText: "Şehir Giriniz"),
      validator: (value) {
        if (validateCity(value!)) {
          return null;
        } else {
          return "Şehir bilgisi en az 3 karakter olmalıdır.";
        }
      },
      onSaved: (var value) => student.lastName = value,
    );
  }

  Widget buildBirthdayField() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: "ÖĞRENCİNİN DOĞUM TARİHİ", hintText: "GG.AA.YYYY"),
      validator: (value) {
        if (validateBirthday(value!)) {
          return null;
        } else {
          return "Doğum gününüz GG.AA.YYYY formatında olmalıdır.";
        }
      },
      onSaved: (var value) => student.lastName = value,
    );
  }

  Widget buildSumbitButton() {
    // ignore: deprecated_member_use
    return RaisedButton(
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF22577A),
                Color(0xFF38A3A5),
                Color(0xFF57CC99),
              ],
            ),
          ),
          padding: const EdgeInsets.only(top: 10, left: 20, bottom: 10, right: 20),
          child: const Text('Kaydet'),
        ),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            studentAddMassage = "Başarısız";
          } else {
            formKey.currentState!.save();
            students.add(student);
            studentAddMassage = "Başarılı";
          }
          sendMessage(context, titleBar, studentAddMassage);
        });
  }
}
