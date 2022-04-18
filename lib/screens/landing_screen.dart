import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yroz_admin/LogicLayer/AppUser.dart';
import 'package:yroz_admin/screens/login_screen.dart';
import 'package:yroz_admin/screens/tabs_screen.dart';

class LandingPage extends StatelessWidget {
  static const routeName = '/landing';

  @override
  Widget build(BuildContext context) {
    final appUser = context.watch<AppUser>().isSignedIn;
    print(appUser);
    return appUser ? TabsScreen() : EmailSignInPage();
  }
}
