// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:ui_e_learning_app/cores/cores.dart';

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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (_, __) {
          return [
            SliverPersistentHeader(
              floating: true,
              pinned: true,
              delegate: LearnedCardDelegate(
                child: LearnedCard(
                  onPressed: () {},
                  currentLearned: 30,
                  targetLearned: 100,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 10),
              sliver: SliverToBoxAdapter(
                child: LearnedCard(
                  onPressed: () {},
                  currentLearned: 30,
                  targetLearned: 100,
                ),
              ),
            ),
          ];
        },
        body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(
              title: Center(child: Text('Text $index')),
            );
          },
        ),
      ),
    );
  }
}

class LearnedCardDelegate extends SliverPersistentHeaderDelegate {
  LearnedCardDelegate({required this.child});

  final Widget child;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  double get maxExtent => 140; // Set the maximum height of your card

  @override
  double get minExtent => 140; // Set the minimum height of your card

  @override
  bool shouldRebuild(LearnedCardDelegate oldDelegate) {
    return child != oldDelegate.child;
  }
}

class LearnedCard extends StatelessWidget {
  const LearnedCard({
    required this.currentLearned, required this.targetLearned, super.key,
    this.onPressed,
  });

  final int currentLearned;
  final int targetLearned;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20);

    return Padding(
      padding: const EdgeInsets.only(right: 18, left: 18, bottom: 20, top: 8),
      child: InkWell(
        onTap: onPressed,
        borderRadius: borderRadius,
        child: Ink(
          padding: const EdgeInsets.all(20),
          height: 110,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: borderRadius,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[200]!,
                blurRadius: 10,
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  color: const Color(0xFF2F80ED).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: SvgPicture.asset(
                  Assets.iconsSVG.calendar,
                  width: 50,
                  height: 50,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Learned today',
                        style: context.theme.textTheme.titleLarge,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: currentLearned.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  fontSize: 28,
                                ),
                                children: [
                                  TextSpan(
                                    text: '/$targetLearned',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'minute',
                              style: context.theme.textTheme.headlineSmall?.copyWith(
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CircularStepProgressIndicator(
                padding: 0,
                currentStep: currentLearned,
                totalSteps: targetLearned,
                selectedStepSize: 3.7,
                unselectedStepSize: 3.7,
                width: 60,
                height: 60,
                unselectedColor: const Color(0xFFEEF0F3),
                roundedCap: (_, __) => true,
                child: Center(
                  child: Text(
                    '${(currentLearned / targetLearned * 100).round()}%',
                    style: const TextStyle(
                      fontSize: 14.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
