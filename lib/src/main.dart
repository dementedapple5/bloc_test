import 'package:bloc_test/src/ui/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
      home: LoginPage(),
    );
  }
}

