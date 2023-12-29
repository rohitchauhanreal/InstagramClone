import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String username;
  final String postId;
  final datePublished;
  final String postUrl;
  final String ProfileImage;
  final likes;

  const Post({
    required this.description,
    required this.postUrl,
    required this.username,
    required this.uid,
    required this.ProfileImage,
    required this.likes,
    required this.datePublished,
    required this.postId,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "ProfileImage": ProfileImage,
        "description": description,
        "likes": likes,
        "datePublished": datePublished,
        "postId": postId,
        "postUrl": postUrl,
      };

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      username: snapshot['username'],
      uid: snapshot['uid'],
      postId: snapshot['postId'],
      postUrl: snapshot['photoUrl'],
      datePublished: snapshot['bio'],
      likes: snapshot['likes'],
      description: snapshot['description'],
      ProfileImage: snapshot['ProfileImage'],
    );
  }
}
