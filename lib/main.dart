import 'package:flutter/material.dart';
import 'package:news/pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        splashColor: Colors.teal
      ),
      home: HomePage(),
    );
  }
}

