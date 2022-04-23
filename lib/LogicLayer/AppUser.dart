import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:f_logs/f_logs.dart';
import 'package:flutter/material.dart';
import 'package:yroz_admin/amplifyconfiguration.dart';

class AppUser extends ChangeNotifier {
  bool isSignedIn = false;
  String username = "yrozcomapny@gmail.com";

  AppUser() {
    if (!Amplify.isConfigured) configureAmplify();
  }

  void configureAmplify() async {
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    Amplify.addPlugins([authPlugin]);

    try {
      await Amplify.configure(amplifyconfig);
    } catch (e) {
      FLog.error(text: e.toString(), stacktrace: StackTrace.current);
    } finally {
      signOut();
    }
  }

  void signIn(AuthProvider authProvider) async {
    try {
      await Amplify.Auth.signInWithWebUI(provider: authProvider);
      isSignedIn = true;
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      await Amplify.Auth.signOut();
      isSignedIn = false;
      notifyListeners();
    } on AuthException catch (e) {
      print(e.message);
    }
  }

  signInWithEmailAndPassword(String email, String password) async {
    try {
      signOut(); // TODO: REMOVE IT
      SignInResult res = await Amplify.Auth.signIn(
        username: email.trim(),
        password: password.trim(),
      );

      isSignedIn = res.isSignedIn;
      notifyListeners();
    } catch (e) {
      signOut();
      FLog.error(text: e.toString(), stacktrace: StackTrace.current);
      throw e;
    }
  }
}
