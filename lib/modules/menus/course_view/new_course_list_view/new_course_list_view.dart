import 'package:flutter/material.dart';
import 'package:ui_e_learning_app/components/components.dart';
import 'package:ui_e_learning_app/cores/cores.dart';
import 'package:ui_e_learning_app/models/course/video_course.dart';

class NewCoursesListView extends StatelessWidget {
  const NewCoursesListView({
    required this.newCourses,
    super.key,
  });

  final List<VideoCourse> newCourses;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SubHeader(
              title: 'New Courses',
              onPressed: () {},
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 300,
            width: context.screenWidth,
            child: ListView(
              primary: false,
              padding: const EdgeInsets.symmetric(horizontal: 13),
              scrollDirection: Axis.horizontal,
              children: newCourses
                  .map(
                    (item) => NewCourseCard(
                      onPressed: () {},
                      title: item.title,
                      countPlays: item.countPreviewVideoPlays,
                      imageUrl: item.imageUrl,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
