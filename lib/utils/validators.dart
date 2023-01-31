class Validators{
  static bool validatePhoneNumber(String input) {
    bool validation = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(input);
    return validation;
  }
}