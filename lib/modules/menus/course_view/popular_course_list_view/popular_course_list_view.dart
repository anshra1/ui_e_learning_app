import 'package:flutter/material.dart';
import 'package:ui_e_learning_app/components/components.dart';
import 'package:ui_e_learning_app/models/course/video_course.dart';

class PopularCoursesListView extends StatelessWidget {
  const PopularCoursesListView({
    required this.popularCourses,
    super.key,
  });

  final List<VideoCourse> popularCourses;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 23),
      child: Column(
        children: [
          SubHeader(
            title: 'Popular Courses',
            onPressed: () {},
          ),
          const SizedBox(height: 20),
          ListView(
            primary: false,
            shrinkWrap: true,
            children: popularCourses
                .map(
                  (item) => VideoCourseCard(
                    onPressed: () {},
                    item: item,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
