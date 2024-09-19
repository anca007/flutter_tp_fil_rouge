import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/Tweet.dart';

class TweetButton extends StatelessWidget {
  String? label;
  String? iconPath;

  TweetButton({super.key, this.label, this.iconPath});

  Widget checkButton() {
    // Si icon path est renseignée, alors afficher un icon button
    if (this.iconPath != null) {
      return IconButton(onPressed: () {}, icon: Image.asset(this.iconPath!));
    }
    // Sinon par défaut le text habituel
    return Text(this.label!, textAlign: TextAlign.center);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: checkButton());
  }
}

class TweetCard extends StatelessWidget {
  Tweet tweet;

  TweetCard(this.tweet, {super.key});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        // Image + Texte
        Container(
          height: 150,
          child: Flex(
            direction: Axis.horizontal,
            children: [
              SizedBox(
                width: 150,
                child: Image.network(
                  tweet.profile!,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            tweet.author!,
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            //installer intl en dépendance + import
                            DateFormat('yyyy-MM-dd').format(tweet.createdDate!),
                            //tweet.createdDate,
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(tweet.message!),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              TweetButton(iconPath: "images/reply.png"),
              TweetButton(iconPath: "images/retweet.png"),
              TweetButton(iconPath: "images/favorite.png"),
            ],
          ),
        )
      ],
    );
  }
}
