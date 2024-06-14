// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ui_e_learning_app/models/course/course.dart';
import 'package:ui_e_learning_app/models/course/teacher.dart';

class LiveCourse extends Course {
  LiveCourse({
    required this.liveStreamingURL,
    required this.liveDuration,
    required this.liveTime,
    required super.id,
    required super.title,
    required super.level,
    required super.imageUrl,
    required super.teacher,
    required super.createdAt,
    super.countStudents = 0,
  });

  factory LiveCourse.fromJson(Map<String, dynamic> json) {
    return LiveCourse(
      liveStreamingURL: (json['liveStreamingURL'] ?? '') as String,
      liveDuration: (json['liveDuration'] ?? '') as String,
      liveTime: DateTime.parse(json['liveTime'].toString()),
      id: int.tryParse(json['id'].toString()) ?? 0,
      title: json['title'] != null ? json['title'] as String : '',
      level: (json['level'] ?? '') as String,
      imageUrl: (json['imageUrl']  ?? '') as String,
      teacher: json['teacher'] != null
          ? Teacher.fromJson(json['teacher'] as Map<String, dynamic>)
          : Teacher.empty(),
      createdAt:
          DateTime.tryParse(json['createdAt'].toString()) ?? DateTime.now(),
      countStudents: int.tryParse(json['countStudents'].toString()) ?? 0,
    );
  }

  final String liveStreamingURL;
  final String liveDuration;
  final DateTime liveTime;
}
