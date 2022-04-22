import 'package:flutter/material.dart';
import 'package:yroz_admin/LogicLayer/AppUser.dart';
import 'package:yroz_admin/LogicLayer/validators.dart';

class EmailSignIn with EmailAndPasswordValidator, ChangeNotifier {
  final AppUser appUser;
  String email;
  String password;
  bool isLoading;
  bool submitted;
  String code;

  EmailSignIn({
    required this.appUser,
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
    updateWith(submitted: true, isLoading: true);

    try {
      final user = await appUser.signInWithEmailAndPassword(email, password);
    } catch (e) {
      updateWith(isLoading: false);
      rethrow;
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
