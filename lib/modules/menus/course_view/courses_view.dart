import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:ui_e_learning_app/components/components.dart';
import 'package:ui_e_learning_app/cores/cores.dart';
import 'package:ui_e_learning_app/dummies/categories_dummy.dart';
import 'package:ui_e_learning_app/dummies/video_courses_dummy.dart';
import 'package:ui_e_learning_app/models/course/categories.dart';
import 'package:ui_e_learning_app/models/course/video_course.dart';
import 'package:ui_e_learning_app/modules/menus/course_view/CategoriesListView/categories_list_view.dart';
import 'package:ui_e_learning_app/modules/menus/course_view/new_course_list_view/new_course_list_view.dart';
import 'package:ui_e_learning_app/modules/menus/course_view/popular_course_list_view/popular_course_list_view.dart';

class CoursesView extends StatefulWidget {
  const CoursesView({super.key});
  static const String routeName = '/courses';

  @override
  State<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {
  final categories = <Category>[];
  final newCourses = <VideoCourse>[];
  final popularCourses = <VideoCourse>[];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final now = DateTime.now();

    final categories = categoriesJSON.map(Category.fromJson);

    final courses = videoCoursesJSON.map(VideoCourse.fromJson);

    final newCourses = courses.where(
      (e) => now.difference(e.createdAt).inDays < 17,
    );
    final popularCourses = courses.where((e) => e.countStudents > 17000);

    this.categories
      ..clear()
      ..addAll(categories);

    this.newCourses
      ..clear()
      ..addAll(newCourses);

    this.popularCourses
      ..clear()
      ..addAll(popularCourses);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        centerTitle: false,
        title: Text(
          'Courses',
          style: context.theme.textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Ionicons.search),
          ),
        ],
      ),
      body: AppPullRefresh(
        onRefresh: loadData,
        child: SingleChildScrollView(
          primary: true,
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 25, top: 6),
          child: Column(
            children: [
              CategoriesListView(
                categories: categories,
              ),
              NewCoursesListView(
                newCourses: newCourses,
              ),
              PopularCoursesListView(
                popularCourses: popularCourses,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
