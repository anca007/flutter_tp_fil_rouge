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
 
  @override
  Widget build(BuildContext context) {
    String? mail = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(title: Text("Twitter ! Bienvenue ${mail}")),
      body: Column(
        children: [
          Header(),
          Expanded(
              //Utilisé le FutureBuilder pour générer le composant de manière asynchrone
              child: FutureBuilder<http.Response>(
            //url de l'appel
            future: http.get(Uri.parse(
                "https:raw.githubusercontent.com/Chocolaterie/EniWebService/main/api/tweets.json")),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data?.body != null) {
                //récupérartion du body de la réponse
                var body = snapshot.data!.body;
                //je convertis le body en json
                List<dynamic> json = convert.jsonDecode(body);
                //je crée les instances de tweets
                var tweets = List<Tweet>.from(
                    json.map((jsonTweet) => Tweet.fromJson(jsonTweet)));
                return TweetList(tweets);
              }
              //si c'est pas ok je renvoie une progress bar ou message d'erreur si trop long
              return CircularProgressIndicator();
            },
          )),
          Footer()
        ],
      ),
    );
  }
}

class TweetList extends StatelessWidget {
  final List<Tweet> tweets;

  TweetList(this.tweets);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tweets.length,
        itemBuilder: (BuildContext context, int index) {
          return TweetCard(tweets[index]);
        });
  }
}
