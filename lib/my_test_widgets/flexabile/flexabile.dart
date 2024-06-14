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
        //  brightness: Brightness.dark,
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
        body: Column(
          children: [
            // Flexible Example
            Row(
              children: [
                const Expanded(
                  child: ColoredBox(
                    color: Colors.red,
                    child: Text('Text with variable width'),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.green,
                  ),
                ),
              ],
            ),

// Expanded Example
            Row(
              children: [
                const Flexible(
                  child: ColoredBox(
                    color: Colors.red,
                    child: Text('Text with variable width'),
                  ),
                ),
                Flexible(
                  child: Container(
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),);
  }
}
