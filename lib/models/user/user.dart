part 'user_leveling.dart';
part 'user_profile.dart';

class User {
  User({
    required this.uid,
    required this.membership,
    required this.profile,
    required this.leveling,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'] as String,
      membership: json['membership'] as String,
      profile: UserProfile.fromJson(json['profile'] as Map<String, dynamic>),
      leveling: UserLeveling.fromJson(json['leveling'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'].toString()).toLocal(),
    );
  }

  final String uid;
  final String membership;
  final UserProfile profile;
  final UserLeveling leveling;
  final DateTime createdAt;

  User copyWith({
    String? uid,
    String? membership,
    UserProfile? profile,
    UserLeveling? leveling,
    DateTime? createdAt,
  }) =>
      User(
        uid: uid ?? this.uid,
        membership: membership ?? this.membership,
        profile: profile ?? this.profile,
        leveling: leveling ?? this.leveling,
        createdAt: createdAt ?? this.createdAt,
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'membership': membership,
        'profile': profile.toJson(),
        'leveling': leveling.toJson(),
        'createdAt': createdAt.toUtc(),
      };
}
