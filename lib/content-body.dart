import 'package:flutter/material.dart';
import 'package:tweeter/tweet-card.dart';
import 'login-form.dart';

class ContentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        LoginForm(),
        TweetCard(),
      ],
    );
  }
}
