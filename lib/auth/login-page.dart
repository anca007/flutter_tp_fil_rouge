import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tweeter/auth/login-form.dart';

class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: LoginForm(),
    );
  }
}