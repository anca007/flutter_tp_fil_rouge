import 'package:json_annotation/json_annotation.dart';

part 'Tweet.g.dart';

@JsonSerializable()
class Tweet {
  int? id;
  String? profile;
  @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp, name: "created_date")
  DateTime? createdDate;
  String? author;
  String? message;

  // Fonctions de conversion pour DateTime
  static DateTime _fromJsonTimestamp(int timestamp) => DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  static int _toJsonTimestamp(DateTime? date) => date != null ? (date.millisecondsSinceEpoch ~/ 1000) : 0;

  Tweet(this.id, this.profile, this.createdDate, this.author, this.message);

  // Tweet.fromJson(Map<String, dynamic> data) {
  //   id = data['id'];
  //   profile = data['profile'];
  //   createdDate =
  //       DateTime.fromMillisecondsSinceEpoch(data['created_date'] * 1000);
  //   author = data['author'];
  //   message = data['message'];
  // }

  // Méthode générée pour la sérialisation à partir du JSON
  factory Tweet.fromJson(Map<String, dynamic> json) => _$TweetFromJson(json);

  // Méthode générée pour la conversion de l'objet en JSON
  Map<String, dynamic> toJson() => _$TweetToJson(this);


}
