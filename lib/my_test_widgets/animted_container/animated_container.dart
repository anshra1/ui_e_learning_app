import 'package:flutter/material.dart';

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
          brightness: Brightness.dark,
          primarySwatch: Colors.blueGrey,
          indicatorColor: Colors.blueGrey,
        ),
        home: const HomePage(),);
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
      body: const AnimatedContainerExample(),
    );
  }
}

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool _isLarge = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isLarge = !_isLarge;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(seconds:2),
          curve: Curves.easeInOut,
          height: _isLarge ? 200 : 100,
          width: _isLarge ? 200 : 100,
          color: _isLarge ? Colors.red : Colors.blue,
          child: const Center(
            child: Text('Tap to animate', style: TextStyle(fontSize: 20)),
          ),
        ),
      ),
    );
  }
}
