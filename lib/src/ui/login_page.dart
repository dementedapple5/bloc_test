import 'package:bloc_test/src/blocs/user_bloc.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (text) => userBloc.emailIn.add(text),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email"
              ),
            ),
            TextField(
              onChanged: (text) => userBloc.passwordIn.add(text),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email"
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: null,
            )
          ],
        ),
      ),
    );
  }
}
