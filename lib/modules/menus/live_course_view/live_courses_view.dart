import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ui_e_learning_app/components/cards/live_course_card.dart';
import 'package:ui_e_learning_app/components/components.dart';
import 'package:ui_e_learning_app/cores/cores.dart';
import 'package:ui_e_learning_app/dummies/live_courses_dummy.dart';
import 'package:ui_e_learning_app/models/course/live_course.dart';
import 'package:ui_e_learning_app/modules/menus/live_course_view/appointment_dialog.dart';

class LiveCoursesView extends StatefulWidget {
  const LiveCoursesView({super.key});
  static const String routeName = '/live-courses';

  @override
  State<LiveCoursesView> createState() => _LiveCoursesViewState();
}

class _LiveCoursesViewState extends State<LiveCoursesView> {
  final liveCourses = <LiveCourse>[];
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    liveCourses
      ..clear()
      ..addAll(List<LiveCourse>.from(liveCoursesJSON.map(LiveCourse.fromJson)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          'Live Courses',
          style: context.theme.textTheme.titleLarge,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(14),
            child: Icon(
              AppIcons.calendar,
              size: 25,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      body: AppPullRefresh(
        onRefresh: loadData,
        child: SingleChildScrollView(
          primary: true,
          padding: const EdgeInsets.only(top: 10),
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18)
                    .copyWith(bottom: 10),
                child: const Text(
                  'Wonderful live courses, interact with teachers ',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Gap(17),
                  itemCount: liveCourses.length,
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = liveCourses[index];
                    return LiveCourseCard(
                      item: item,
                      onPressed: () {
                        // showAnimatedDialog(
                        //   context: context,
                        //   animationType: DialogTransitionType.slideFromBottom,
                        //   curve: Curves.ease,
                        //   barrierColor: Colors.black.withOpacity(.8),
                        //   builder: (_) {
                        //     return AppointmentDialog(item: item);
                        //   },
                        // );
                        showDialog<void>(
                          context: context,
                          builder: (_) => AppointmentDialog(item: item),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
