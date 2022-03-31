// ignore_for_file: unnecessary_this, prefer_initializing_formals, prefer_typing_uninitialized_variables

class Student {
  var photo;
  var firstName;
  var lastName;
  var school;
  var city;
  var birthday;

  Student(String photo, String firstName, String lastName, String school, String city, String birthday){
    this.photo = photo;
    this.firstName = firstName;
    this.lastName = lastName;
    this.school = school;
    this.city = city;
    this.birthday = birthday;
  }

  // ignore: empty_constructor_bodies
  Student.withoutInfo() {}
}
