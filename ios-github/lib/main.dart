import 'package:flutter/material.dart';
import 'package:github_issues/add_username.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Issues',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AddUsernamePage(),
    );
  }
}
