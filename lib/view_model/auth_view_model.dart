import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../route/routes.dart';
import '../util/util.dart';

class AuthViewModel with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  String _email = '';
  String get email => _email;
  set email(String email) {
    _email = email;
    notifyListeners();
  }

  String _phone = '';
  String get phone => _phone;
  set phone(String email) {
    _phone = phone;
    notifyListeners();
  }

  String _password = '';
  String get password => _password;
  set password(String password) {
    _password = password;
    notifyListeners();
  }

  String? emailValidate(String value) {
    const String format =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    return RegExp(format).hasMatch(value) ? null : "Enter valid email";
  }

  String? passValidate(String value) {
    if (value.isEmpty)
      return "Please fill Password";
    else if (value.length < 8) return "Password is less than 8";
  }

  String? phoneValidate(String value) {
    const String format = r'^(?:[+0][1-9])?[0-9]{10,12}$';

    return RegExp(format).hasMatch(value) ? null : "Enter valid number";
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setLoading(true);
    Utils.snackBar('SignUp Successfully', context);
    Navigator.pushNamed(context, Routes.home);
    setLoading(false);
  }
}
