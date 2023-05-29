import 'package:comp_demo/pages/cat.dart';
import 'package:comp_demo/paint.dart';
import 'package:flutter/material.dart';

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
      title: 'Shopping',
      theme: ThemeData(primarySwatch: primary ),
      home: Cat(),
    );
  }
}