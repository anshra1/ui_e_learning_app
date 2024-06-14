import 'package:ui_e_learning_app/models/course/teacher.dart';

abstract class Course {
  Course({
    required this.id,
    required this.title,
    required this.level,
    required this.imageUrl,
    required this.teacher,
    required this.createdAt,
    this.description,
    this.countStudents = 0,
  });
  final int id;
  final String title;
  final String? description;
  final String level;
  final String imageUrl;
  final Teacher teacher;
  final int countStudents;
  final DateTime createdAt;
}
