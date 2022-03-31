// ignore_for_file: file_names, void_checks

class StudentValidationMixin {
  bool validateFirstName(String firstName) => (firstName.length >= 3) ? (true) : (false);
  bool validateLastName(String lastName) => (lastName.length >= 2) ? (true) : (false);
  bool validateSchool(String school) => (school.length >= 8) ? (true) : (false);
  bool validateCity(String city) => (city.length >= 3) ? (true) : (false);
  bool validateBirthday(String birth) => (birth.length >= 10) ? (true) : (false);
}
