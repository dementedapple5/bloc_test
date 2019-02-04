import 'package:bloc_test/src/ui/welcome_page.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          display1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.black87),
          display2: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
          display3: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.blue),
        ),
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
    );
  }
}

