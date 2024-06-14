import 'package:ui_e_learning_app/dummies/users_dummy.dart';
import 'package:ui_e_learning_app/models/user/user.dart';

class Comment {
  const Comment({
    required this.id,
    required this.text,
    required this.user,
    required this.createdAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: int.tryParse(json['id'].toString()) ?? 0,
      // ignore: unnecessary_cast
      text: json['text'] != null ? json['text'] as String : 'error' as String,
      user: json['user'] != null
          // ignore: unnecessary_cast
          ? User.fromJson(json['user'] as Map<String, dynamic>) as User
          : users,
      createdAt: DateTime.parse(json['createdAt'].toString()).toLocal(),
    );
  }

  Comment.empty()
      : this(
          id: 1,
          text: 'c',
          user: users,
          createdAt: DateTime.now(),
        );


  final int id;
  final String text;
  final User user;
  final DateTime? createdAt;


    

  Map<String, dynamic> toJson() => {
        'id': id,
        'text': text,
        'user': user.toJson(),
        'createdAt': createdAt?.toUtc(),
      };
}

final users = User(
  uid: 'qwerty123',
  membership: 'free',
  profile:
      UserProfile.fromJson(usersJSON[0]['profile']! as Map<String, dynamic>),
  leveling:
      UserLeveling.fromJson(usersJSON[0]['leveling']! as Map<String, dynamic>),
  createdAt: DateTime.now(),
);
