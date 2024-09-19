import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tweeter/tweet/header.dart';
import 'package:tweeter/tweet/tweet-card.dart';

import '../model/Tweet.dart';
import 'footer.dart';

class TweetPage extends StatefulWidget {
  @override
  State<TweetPage> createState() => _TweetPageState();
}

class _TweetPageState extends State<TweetPage> {
  List<Tweet> tweets = [];

  @override
  void initState() {
    //Cette méthode est à utiliser pour lancer les chargement aync, plutot que dans le constructeur
    //car cette méthode respecte le cycle de vie du composant
    super.initState();
    callApi();
  }


  void callApi() async {
    var response = await http.get(Uri.parse(
        "https://raw.githubusercontent.com/Chocolaterie/EniWebService/main/api/tweets.json"));

    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);

      if (json is List) {
        setState(() {
          tweets = List<Tweet>.from(
              json.map((jsonTweet) => Tweet.fromJson(jsonTweet)));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String? mail = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(title: Text("Twitter ! Bienvenue ${mail}")),
      body: Column(
        children: [
          Header(),
          Expanded(
              child: ListView.builder(
                  itemCount: tweets.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TweetCard(tweets[index]);
                  })),
          Footer()
        ],
      ),
    );
  }
}
