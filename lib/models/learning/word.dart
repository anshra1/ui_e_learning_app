class Word {
  Word({
    required this.id,
    required this.name,
    required this.phonological,
    required this.meanings,
    required this.level,
    required this.progress,
  });

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      id: int.tryParse(json['id'].toString()) ?? 0,
      name: json['name'] as String,
      phonological: json['phonological'] as String,
      meanings: List<String>.from(
        (json['meanings'] as List<String>).map((x) => x),
      ),
      level: json['level'] as String,
      progress: json['progress'] as String,
    );
  }
  final int id;
  final String name;
  final String phonological;
  final List<String> meanings;
  final String level;
  final String progress;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phonological': phonological,
        'meanings': List<dynamic>.from(meanings.map((x) => x)),
        'level': level,
        'progress': progress,
      };
}
