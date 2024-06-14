import 'package:ui_e_learning_app/models/course/categories.dart';
import 'package:ui_e_learning_app/models/course/comment.dart';
import 'package:ui_e_learning_app/models/course/course.dart';
import 'package:ui_e_learning_app/models/course/lesson.dart';
import 'package:ui_e_learning_app/models/course/teacher.dart';

class VideoCourse extends Course {
  VideoCourse({
    required super.id,
    required super.title,
    required super.description,
    required super.level,
    required super.imageUrl,
    required super.teacher,
    required this.previewVideoUrl,
    required this.previewVideoDuration,
    required super.createdAt,
    this.categories = const <Category>[],
    this.lessons = const <Lesson>[],
    this.comments = const <Comment>[],
    super.countStudents = 0,
    this.countPreviewVideoPlays = 0,
  });

  factory VideoCourse.fromJson(Map<String, dynamic> json) {
    return VideoCourse(
      id: int.tryParse(json['id'].toString()) ?? 0,
      title: json['title'] as String,
      description: json['description'] as String,
      level: json['level'] as String,
      imageUrl: json['imageUrl'] as String,
      teacher: Teacher.fromJson(json['teacher'] as Map<String, dynamic>),
      previewVideoUrl: json['previewVideoUrl'] as String,
      previewVideoDuration: json['previewVideoDuration'] as String,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      lessons: List<Lesson>.from(
        (json['lessons'] as List<Map<String, dynamic>>)
            .map(Lesson.fromJson)
            .toList(),
      ),
      comments: json['comments'] != null
          ? (json['comments'] as List<Map<String, dynamic>>)
              .map(Comment.fromJson)
              .toList()
          : [],
      countStudents: int.tryParse(json['countStudents'].toString()) ?? 0,
      countPreviewVideoPlays:
          int.tryParse(json['countPreviewVideoPlays'].toString()) ?? 0,
      createdAt: DateTime.parse(json['createdAt'].toString()),
    );
  }
  final String previewVideoUrl;
  final String previewVideoDuration;
  final List<Category> categories;
  final List<Lesson> lessons;
  final List<Comment> comments;
  final int countPreviewVideoPlays;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'level': level,
        'imageUrl': imageUrl,
        'teacher': teacher.toJson(),
        'previewVideoUrl': previewVideoUrl,
        'previewVideoDuration': previewVideoDuration,
        'categories': List<dynamic>.from(categories.map((x) => x.toJson())),
        'lessons': List<dynamic>.from(lessons.map((x) => x.toJson())),
        'comments': List<dynamic>.from(comments.map((x) => x.toJson())),
        'countStudents': countStudents,
        'countPreviewVideoPlays': countPreviewVideoPlays,
        'createdAt': createdAt,
      };
}
