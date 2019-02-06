import 'package:bloc_test/src/ui/auth_page.dart';
import 'package:bloc_test/src/utils/measures_const.dart';
import 'package:bloc_test/src/utils/text_const.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: FlatButton(
                child: Text(login_text.toUpperCase(), style: Theme.of(context).textTheme.display1),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AuthPage(true), fullscreenDialog: true));
                },
              )
            ),
            Expanded(
              child: FlatButton(
                color: Theme.of(context).primaryColor,
                child: Text(sign_up_text.toUpperCase(),  style: Theme.of(context).textTheme.button),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AuthPage(false), fullscreenDialog: true));
                },
              )
            )
          ],
        ),
      ),
    );
  }


}
