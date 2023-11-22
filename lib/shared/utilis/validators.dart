bool passwordValidator(String password) {
  final RegExp regex = RegExp(r"^[a-zA-Z0-9]+$");
  return regex.hasMatch(password);
}
