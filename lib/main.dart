import 'package:first_task/body.dart';
import 'package:first_task/welcome_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: welcome_page(),
    );
  }
}
