import 'package:flutter/material.dart';

import 'Home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:HomeScreen(),
    );
  }
}

// https://www.figma.com/design/V7TksazJ4d9EsE11TQxmzc/Online-Bike-Shopping-App--Community-?node-id=1-4&p=f&t=N90DjizEl15FDd76-0