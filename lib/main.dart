import 'package:flutter/material.dart';
import 'package:snsante/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sn Santé',
       debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
