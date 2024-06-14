// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:ui_e_learning_app/components/components.dart';
import 'package:ui_e_learning_app/cores/cores.dart';
import 'package:ui_e_learning_app/dummies/learnings_dummy.dart';
import 'package:ui_e_learning_app/models/learning/learning.dart';
import 'package:ui_e_learning_app/modules/menus/home_view/home_learning_list.dart';
import 'package:ui_e_learning_app/modules/menus/home_view/home_tab_bar.dart';

const tabItems = <String>[
  'Recommend',
  'Hot',
  'Movies',
  'Story Telling',
  'Traveling',
  'Business',
  'Grammar',
];

class HomeView extends HookWidget {
  const HomeView({super.key});

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final selectedTabNotifier = useValueNotifier<String>(tabItems.first);
    final learningsNotifier = useValueNotifier<List<Learning>>([]);

    useEffect(
      () {
        LoadData.loadData(
          selectedTabNotifier: selectedTabNotifier,
          learningsNotifier: learningsNotifier,
        );

        return null;
      },
      const [],
    );

    selectedTabNotifier.addListener(() {
      LoadData.loadData(
        category: selectedTabNotifier.value,
        selectedTabNotifier: selectedTabNotifier,
        learningsNotifier: learningsNotifier,
      );
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        centerTitle: false,
        title: Text(
          'Morning!',
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
        onRefresh: LoadData.loadData,
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (_, __) {
            return [
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
          body: Column(
            children: [
              ValueListenableBuilder<String>(
                valueListenable: selectedTabNotifier,
                builder: (_, currentItem, __) {
                  return HomeTabBar(
                    items: tabItems,
                    currentItem: currentItem,
                    onChanged: (value) => selectedTabNotifier.value = value,
                  );
                },
              ),
              ValueListenableBuilder<List<Learning>>(
                valueListenable: learningsNotifier,
                builder: (_, learnings, __) {
                  return HomeLearningList(
                    learnings: learnings,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

sealed class LoadData {
  static Future<void> loadData({
    String? category,
    ValueNotifier<String>? selectedTabNotifier,
    ValueNotifier<List<Learning>>? learningsNotifier,
  }) async {
    final learnings = List<Learning>.from(
      learningsJSON.map(Learning.fromJson),
    );

    final add = <Learning>[];

    if (category != null) {
      // learnings.removeWhere((it) => !it.categories.contains(category));

      final list =
          learnings.where((it) => it.categories.contains(category)).toList();
      add.addAll(list);
    } else {
      add.addAll(learnings);
      // selectedTabNotifier?.value = tabItems.first;
    }

    learningsNotifier!.value = add;
    // learningsNotifier?.value = learnings;
  }
}
