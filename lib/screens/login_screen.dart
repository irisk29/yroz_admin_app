import 'package:flutter/material.dart';
import 'package:yroz_admin/widget/email_form.dart';

class EmailSignInPage extends StatelessWidget {
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        elevation: 10,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 5,
              child: EmailSignInForm.create(context),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
