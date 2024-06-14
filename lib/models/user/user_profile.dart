part of 'user.dart';

class UserProfile {

  UserProfile({
    required this.firstname,
    required this.username, required this.email, this.lastname,
    this.phone,
    this.avatarURL,
    this.updatedAt,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      firstname: json['firstname']as String,
      lastname: json['lastname']as String,
      username: json['username']as String,
      email: json['email']as String,
      phone: json['phone']as String,
      avatarURL: json['avatarURL']as String,
      updatedAt: DateTime.tryParse(json['updatedAt'].toString())?.toLocal(),
    );
  }
  final String firstname;
  final String? lastname;
  final String username;
  final String email;
  final String? phone;
  final String? avatarURL;
  final DateTime? updatedAt;

  UserProfile copyWith({
    String? firstname,
    String? lastname,
    String? username,
    String? email,
    String? phone,
    String? avatarURL,
    DateTime? updatedAt,
  }) =>
      UserProfile(
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        username: username ?? this.username,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        avatarURL: avatarURL ?? this.avatarURL,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toJson() => {
        'firstname': firstname,
        'lastname': lastname,
        'username': username,
        'email': email,
        'phone': phone,
        'updatedAt': updatedAt?.toUtc(),
      };
}
