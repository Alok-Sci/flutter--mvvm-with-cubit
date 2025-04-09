class Comment {
  int id;
  int postId;
  String name;
  String email;
  String body;

  Comment({
    required this.id,
    required this.postId,
    required this.name,
    required this.email,
    required this.body,
  });

  /// ! factory constructor to create a Comment object from a JSON object
  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json['id'],
        postId: json['postId'],
        name: json['name'],
        email: json['email'],
        body: json['body'],
      );

  /// ! toJson method to convert a Comment object to a JSON object
  Map<String, dynamic> toJson() => {
        'id': id,
        'postId': postId,
        'name': name,
        'email': email,
        'body': body,
      };
}
