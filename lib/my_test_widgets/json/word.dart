class Word {
  Word({
    required this.id,
    required this.name,
    required this.phonological,
    required this.listOfMeanings,
    required this.level,
    required this.progress,
  });

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      id: json['id'] as int,
      name: json['name'] as String,
      phonological: json['phonological'] as String,
      listOfMeanings: List.of(json['meanings'] as List<String>),
      level: json['level'] as String,
      progress: json['progress'] as String,
    );
  }

  final int id;
  final String name;
  final String phonological;
  final List<String> listOfMeanings;
  final String level;
  final String progress;
  @override
  String toString() {
    return 'Word(id: $id\n, name: $name\n, phonological: $phonological\n, listOfMeanings: $listOfMeanings\n, level: $level\n, progress: $progress)';
  }
}
