// ignore_for_file: public_member_api_docs, sort_constructors_first
class Teacher {
  Teacher({
    required this.id,
    required this.name,
    required this.avatarURL,
    required this.graduate,
    required this.bio,
    required this.email,
  });

  Teacher.empty()
      : this(
          id: 0,
          name: '',
          avatarURL: '',
          graduate: '',
          bio: '',
          email: '',
        );

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: int.tryParse(json['id'].toString()) ?? 0,
      name: json['name'] as String,
      avatarURL: json['avatarURL'] as String,
      graduate: json['graduate'] as String,
      bio: json['bio'] as String,
      email: json['email'] as String,
    );
  }
  final int id;
  final String name;
  final String avatarURL;
  final String graduate;
  final String bio;
  final String email;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'avatarURL': avatarURL,
        'graduate': graduate,
        'bio': bio,
        'email': email,
      };

  @override
  String toString() {
    return 'Teacher(id: $id, name: $name, avatarURL: $avatarURL, graduate: $graduate, bio: $bio, email: $email)';
  }
}
