import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yroz_admin/LogicLayer/AppUser.dart';
import 'package:yroz_admin/screens/tabs_screen.dart';
import 'package:yroz_admin/widget/email_login.dart';
import 'package:yroz_admin/widget/error_dialog.dart';

class EmailSignInForm extends StatefulWidget {
  final EmailSignIn? model;

  const EmailSignInForm({Key? key, this.model}) : super(key: key);

  static Widget create(BuildContext context) {
    final appUser = Provider.of<AppUser>(context, listen: false);
    return ChangeNotifierProvider<EmailSignIn>(
      create: (_) => EmailSignIn(appUser: appUser),
      child: Consumer<EmailSignIn>(
        builder: (_, model, __) => EmailSignInForm(model: model),
      ),
    );
  }

  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final FocusNode _codeFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  EmailSignIn? get model => widget.model;

  void _emailEditingComplete() {
    if (model!.emailValidator.isValid(model!.email))
      FocusScope.of(context).requestFocus(_passwordFocusNode);
    else
      FocusScope.of(context).requestFocus(_emailFocusNode);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _codeController.dispose();
    _codeFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    try {
      await model!.submit();
      if (model!.submitted) {
        //Navigator.of(context).pop();
        Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
      }
    } catch (e) {
      showErrorDialog(
        context,
        title: 'Error',
        content: e.toString(),
        defaultActionText: 'Ok',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _buildFormchildren(),
      ),
    );
  }

  List<Widget> _buildFormchildren() {
    return [
      TextField(
        decoration: InputDecoration(
          enabled: model!.isLoading == false,
          labelText: 'Email',
          hintText: 'test@test.com',
          errorText: model!.emailErrorText,
        ),
        controller: _emailController,
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        focusNode: _emailFocusNode,
        onEditingComplete: () => _emailEditingComplete(),
        onChanged: model!.updateEmail,
      ),
      SizedBox(
        height: 8.0,
      ),
      TextField(
        decoration: InputDecoration(
          enabled: model!.isLoading == false,
          labelText: 'Password',
          errorText: model!.passwordErrorText,
        ),
        obscureText: true,
        controller: _passwordController,
        textInputAction: TextInputAction.done,
        focusNode: _passwordFocusNode,
        onEditingComplete: _submit,
        onChanged: model!.updatePassword,
      ),
      SizedBox(
        height: 8.0,
      ),
      ElevatedButton(
        onPressed: model!.submitEnabled ? _submit : null,
        child: Text(
          'Sign In',
        ),
      ),
    ];
  }
}
