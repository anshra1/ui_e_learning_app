// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ui_e_learning_app/components/components.dart';
import 'package:ui_e_learning_app/dummies/users_dummy.dart';
import 'package:ui_e_learning_app/dummies/video_courses_dummy.dart';
import 'package:ui_e_learning_app/models/course/video_course.dart';
import 'package:ui_e_learning_app/models/user/user.dart';
import 'package:ui_e_learning_app/modules/menus/profile_view/menu_button.dart';
import 'package:ui_e_learning_app/modules/menus/profile_view/my_course_card.dart';
import 'package:ui_e_learning_app/modules/menus/profile_view/premium_card.dart';
import 'package:ui_e_learning_app/modules/menus/profile_view/profile_header.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});
  static const String routeName = '/profile';

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late User user;
  final myCourses = <VideoCourse>[];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    user = usersJSON.map(User.fromJson).firstWhere((e) => e.uid == 'qwerty123');
    myCourses
      ..clear()
      ..addAll(
        videoCoursesJSON.reversed.map(VideoCourse.fromJson),
      )
      ..removeAt(0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProfileHeader(user: user),
            PremiumCard(),
            LearnedCard(currentLearned: 3, targetLearned: 10),
            MyCourseCard(courses: myCourses),
            MenuButtoned(),
          ],
        ),
      ),
    );
  }
}
