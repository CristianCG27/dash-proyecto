import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String name = '';

  bool validateForm() {
    if (formKey.currentState!.validate()) {
      print('Form valid ... Login');
      print('$email == $password == $name');
      return true;

      //authProvider.login(email, password);
    } else {
      print('Form NO valid ... Login');
      //print('Form no valid ');
      return false;
    }
  }
}
