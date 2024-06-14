import 'package:ui_e_learning_app/models/learning/word.dart';

class Sentence {
  Sentence({
    required this.text,
    required this.word,
  });

  factory Sentence.fromJson(Map<String, dynamic> json) {
    return Sentence(
      text: json['text'] as String,
      word: Word.fromJson(json['word'] as Map<String, dynamic>),
    );
  }
  final String text;
  final Word word;

  Map<String, dynamic> toJson() => {
        'text': text,
        'word': word.toJson(),
      };
}
