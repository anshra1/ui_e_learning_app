import 'package:ui_e_learning_app/my_test_widgets/json/sentances.dart';

class TestLearningClass {
  const TestLearningClass({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.videoUrl,
    required this.level,
    required this.categories,
    required this.countExercises,
    required this.countStudents,
    required this.countPlays,
    required this.countViews,
    required this.countLikes,
    required this.countComments,
    required this.videoDuration,
    required this.listOfSentances,
  });

  factory TestLearningClass.fromJson(Map<String, dynamic> json) {
    return TestLearningClass(
      id: json['id'] as int,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      videoUrl: json['videoUrl'] as String,
      level: json['level'] as String,
      categories: List.from(json['categories'] as List<String>),
      countExercises: json['countExercises'] as int,
      countStudents: json['countStudents'] as int,
      countPlays: json['countPlays'] as int,
      countViews: json['countViews'] as int,
      countLikes: json['countLikes'] as int,
      countComments: json['countComments'] as int,
      videoDuration: json['videoDuration'] as String,
      listOfSentances:
          (json['sentences'] as List<Map<String, Object>>).map((sentances) {
        return Sentances.fromJson(sentances);
      }).toList(),
    );
  }

  final int id;
  final String title;
  final String imageUrl;
  final String videoUrl;
  final String level;
  final List<String> categories;
  final int countExercises;
  final int countStudents;
  final int countPlays;
  final int countViews;
  final int countLikes;
  final int countComments;
  final String videoDuration;
  final List<Sentances> listOfSentances;

  @override
  String toString() {
    return 'Learning(id: $id\n'
        'title: $title\n'
        'imageUrl: $imageUrl \n, videoUrl: $videoUrl\n, level: $level\n, categories: $categories\n, countExercises: $countExercises\n, countStudents: $countStudents\n, countPlays: $countPlays\n, countViews: $countViews\n, countLikes: $countLikes\n, countComments: $countComments\n, videoDuration: $videoDuration\n, listOfSentances: $listOfSentances)';
  }
}
