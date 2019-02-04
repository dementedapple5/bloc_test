import 'package:bloc_test/src/blocs/user_bloc.dart';
import 'package:bloc_test/src/events/user_events.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<String> (
              stream: userBloc.emailOut,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return TextField(
                  onChanged: (text) => userBloc.emailIn.add(text),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email"
                  ),
                );
              },
            ),

            StreamBuilder<String> (
              stream: userBloc.passwordOut,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return TextField(
                  onChanged: (text) => userBloc.passwordIn.add(text),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password"
                  ),
                );
              },
            ),
            FlatButton(
              onPressed: () =>  userBloc.onUserEvent(LoginEvent()),
              child: Text("LOGIN"),
            )
          ],
        ),
      ),
    );
  }
}
