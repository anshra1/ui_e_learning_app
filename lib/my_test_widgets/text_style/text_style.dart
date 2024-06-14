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
      body: const TextLeadingDistributionExample(),
    );
  }
}

class TextLeadingDistributionExample extends StatelessWidget {
  const TextLeadingDistributionExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'This text uses TextLeadingDistribution.even.',
          style: TextStyle(
            fontSize: 20,
            height: 4.5, // Adjust for visual spacing
            leadingDistribution: TextLeadingDistribution.even,
          ),
        ),
        SizedBox(height: 20),
        Text(
          'This text uses TextLeadingDistribution.proportional.',
          style: TextStyle(
            fontSize: 20,
            height: 1.5,
            leadingDistribution: TextLeadingDistribution.even,
          ),
        ),
        SizedBox(height: 20),
        Text(
          'This text uses TextLeadingDistribution.metric.',
          style: TextStyle(
            fontSize: 20,
            height: 1.5,
            leadingDistribution: TextLeadingDistribution.proportional,
          ),
        ),
      ],
    );
  }
}
