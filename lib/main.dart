import 'package:flutter/material.dart';
import 'package:tweeter/auth/login-page.dart';
import 'package:tweeter/tweet/tweet-page.dart';

void main() {
  runApp(TPTwitterApp());
}

class TPTwitterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        //'/': (context) =>  LoginPage(),
        '/home' : (context) => TweetPage()
      },
        //pour utiliser home, il ne faut pas définir de route '/'
      home: LoginPage()
    );
  }
}
