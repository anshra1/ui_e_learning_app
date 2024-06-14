import 'package:ui_e_learning_app/my_test_widgets/json/word.dart';

class Sentances {
  Sentances({
    required this.text,
    required this.word,
  });

  factory Sentances.fromJson(Map<String, dynamic> json) {
    return Sentances(
      text: json['text'] as String,
      word: Word.fromJson(json['word'] as Map<String, Object>),
    );
  }

  final String text;
  final Word word;

  @override
  String toString() => 'text $text $word';
}
