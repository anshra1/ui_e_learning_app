import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ui_e_learning_app/dummies/learnings_dummy.dart';
import 'package:ui_e_learning_app/my_test_widgets/json/learning.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        indicatorColor: Colors.blueGrey,
      ),
      home: const HomePage(),
    );
  }
}

final s = TestLearningClass.fromJson(learningsJSON[0]);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              s.imageUrl,
            ),
            const Gap(10),
            Text(s.title),
            const Gap(10),
            Text(s.level),
            const Gap(10),
            Text(s.categories[0]),
            const Gap(10),
            Text(s.countExercises.toString()),
            const Gap(10),
            Text(s.countStudents.toString()),
            const Gap(10),
            Text(s.countPlays.toString()),
            const Gap(10),
            Text(s.countViews.toString()),
            const Gap(10),
            Text(s.countLikes.toString()),
            const Gap(10),
            Text(s.countComments.toString()),
            const Gap(10),
            Text(s.videoDuration),
            const Gap(10),
            for (final sen in s.listOfSentances) ...[
              Text(sen.text),
              const Gap(10),
              Text(sen.word.id.toString()),
              const Gap(10),
              Text(sen.word.name),
              const Gap(10),
              Text(sen.word.phonological),
              const Gap(10),
              Text(sen.word.level),
              const Gap(10),
              Text(sen.word.progress),
              const Gap(10),
              for (final word in sen.word.listOfMeanings) ...[
                Text(word),
              ],
              const Gap(10),
            ],
          ],
        ),
      ),
    );
  }
}
