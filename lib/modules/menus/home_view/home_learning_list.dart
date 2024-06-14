import 'package:flutter/material.dart';
import 'package:ui_e_learning_app/components/components.dart';
import 'package:ui_e_learning_app/models/learning/learning.dart';

class HomeLearningList extends StatelessWidget {
  const HomeLearningList({required this.learnings, super.key});

  final List<Learning> learnings;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: learnings
            .map(
              (item) => VideoLearningCard(
                onPressed: () {},
                title: item.title,
                level: item.level,
                imageUrl: item.imageUrl,
                videoDuration: item.videoDuration,
                countExercises: item.countExercises,
                countStudents: item.countStudents,
                countPlays: item.countPlays,
              ),
            )
            .toList(),
      ),
    );
  }
}
