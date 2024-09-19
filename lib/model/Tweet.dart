class Tweet {
  int? id;
  String? profile;
  DateTime? createdDate;
  String? author;
  String? message;

  Tweet(this.id, this.profile, this.createdDate, this.author, this.message);

  Tweet.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    profile = data['profile'];
    createdDate =
        DateTime.fromMillisecondsSinceEpoch(data['created_date'] * 1000);
    author = data['author'];
    message = data['message'];
  }
}
