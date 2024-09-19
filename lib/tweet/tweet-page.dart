import 'package:flutter/material.dart';
import 'package:tweeter/tweet/header.dart';
import 'package:tweeter/tweet/tweet-card.dart';

import 'footer.dart';

class TweetPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    String? mail = ModalRoute.of(context)!.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(title: Text("Twitter ! Bienvenue ${mail}")),
      body: Column(
        children: [
          Header(),
          Expanded(child: TweetCard()),
          Footer()
        ],
      ),
    );
  }



}