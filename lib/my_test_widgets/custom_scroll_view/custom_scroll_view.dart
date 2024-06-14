import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
      home: const ScrollView(),
    );
  }
}

class MyCustomScrollViewPage extends StatefulWidget {
  const MyCustomScrollViewPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyCustomScrollViewPageState createState() => _MyCustomScrollViewPageState();
}

class _MyCustomScrollViewPageState extends State<MyCustomScrollViewPage> {
  final ScrollController _scrollController = ScrollController();
  final List<String> _sections = ['Section 1', 'Section 2', 'Section 3'];

  void _scrollToSection(int index) {
    final anchorOffset = _scrollController.position.pixels +
        _scrollController.position.viewportDimension * (index + 1);

    _scrollController.animateTo(
      anchorOffset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      
    });
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Scroll View with Anchors')),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const SliverAppBar(title: Text('My App')),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        _sections[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    for (int i = 0; i < 10; i++)
                      ListTile(
                        title: Text('Item ${i + 1} in Section ${index + 1}'),
                      ),
                  ],
                );
              },
              childCount: _sections.length,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _sections.asMap().entries.map((entry) {
     
          final section = entry.value;
          return BottomNavigationBarItem(
            icon: const Icon(Icons.book),
            label: section,
          );
        }).toList(),
        onTap: _scrollToSection,
      ),
    );
  }
}

class ScrollView extends HookWidget {
  const ScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    final scrollController = useScrollController();

    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              scrollController.animateTo(
                500,
                duration: const Duration(seconds: 1),
                curve: Curves.decelerate,
              );
            },
            child: const Icon(Icons.arrow_downward),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          scrollController.jumpTo(1);
        },
        child: const Icon(Icons.arrow_upward),
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        // anchor: ,
        physics: const ClampingScrollPhysics(),
        controller: scrollController,
        scrollBehavior: const ScrollBehavior(),
        semanticChildCount: 10,
        //   primary: ,
        slivers: [
          const SliverAppBar(
            title: Text('My App'),
          ),
          const SliverAppBar(
            title: Text('My App 2'),
          ), 
          SliverPadding( // Other SilverList are there
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ListTile(
                    tileColor: Colors.green,
                    selectedColor: Colors.blue,
                    contentPadding: const EdgeInsets.all(10),
                    shape: const Border.symmetric(
                      horizontal: BorderSide(
                        color: Colors.white,
                        width: 3,
                      ),
                    ),
                    title: Text(
                      'Item $index',
                    ),
                  );
                },
                childCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
