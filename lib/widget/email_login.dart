import 'package:flutter/material.dart';
import 'package:yroz_admin/LogicLayer/Secret.dart';
import 'package:yroz_admin/LogicLayer/SecretLoader.dart';
import 'package:yroz_admin/LogicLayer/validators.dart';

class EmailSignIn with EmailAndPasswordValidator, ChangeNotifier {
  String email;
  String password;
  bool isLoading;
  bool submitted;
  String code;

  EmailSignIn({
    this.email = '',
    this.password = '',
    this.isLoading = false,
    this.submitted = false,
    this.code = '',
  });

  String? get passwordErrorText {
    bool showErrorText = submitted && !passwordValidator.isValid(password);
    return showErrorText ? invalidPasswordErrorText : null;
  }

  String? get emailErrorText {
    bool showErrorText = submitted && !emailValidator.isValid(email);
    return showErrorText ? invalidEmailErrorText : null;
  }

  bool get submitEnabled {
    return emailValidator.isValid(email) && passwordValidator.isValid(password) && !isLoading;
  }

  void updateEmail(String email) => updateWith(email: email);

  void updateCode(String code) => updateWith(code: code);

  void updatePassword(String password) => updateWith(password: password);

  Future<void> submit() async {
    Secret secret = await SecretLoader(secretPath: "assets/secrets.json").load();
    if (email == secret.COMPANY_EMAIL && password == secret.PASSWORD) {
      updateWith(submitted: true, isLoading: true);
    } else {
      throw Exception("Wrong email or password, please try again");
    }
  }

  void updateWith({
    String? email,
    String? password,
    bool? isLoading,
    bool? submitted,
    String? code,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.isLoading = isLoading ?? this.isLoading;
    this.submitted = submitted ?? this.submitted;
    this.code = code ?? this.code;
    notifyListeners();
  }
}
