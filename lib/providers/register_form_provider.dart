import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String name = '';

  validateForm() {
    if (formKey.currentState!.validate()) {
      print('Form valid ... Login');
      print('$email == $password == $name');
      return true;
    } else {
      print('Form no valid ');
      return false;
    }
  }
}
