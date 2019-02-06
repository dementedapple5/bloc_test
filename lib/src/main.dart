import 'package:bloc_test/src/ui/welcome_page.dart';
import 'package:bloc_test/src/utils/measures_const.dart';
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
          title: TextStyle(fontSize: title_size, fontWeight: FontWeight.w600, color: Colors.black87),
          body1: TextStyle(fontSize: paragraph_size, color: Colors.grey[600]),
          button: TextStyle(fontSize: title_size, fontWeight: FontWeight.w600, color: Colors.white),
          display1: TextStyle(fontSize: title_size, fontWeight: FontWeight.w600, color: Colors.blue[600]),
        ),
        primaryColor: Colors.blue[600],
      ),
      home: WelcomePage(),
    );
  }
}

