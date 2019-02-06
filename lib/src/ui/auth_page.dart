import 'package:bloc_test/src/blocs/auth_bloc.dart';
import 'package:bloc_test/src/events/user_events.dart';
import 'package:bloc_test/src/ui/welcome_page.dart';
import 'package:bloc_test/src/utils/measures_const.dart';
import 'package:bloc_test/src/utils/text_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  
  
  final bool isLogin;
  
  AuthPage(this.isLogin);

  void changePage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => WelcomePage()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isLogin ? capitalize(login_text) : capitalize(sign_up_text))),
      body: StreamBuilder<FirebaseUser> (
        stream: authBloc.fbUserStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: def_padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildEmailField(),
                buildPasswordField(),
                buildSubmitBtn(context)
              ],
            ),
          );
        },
      )
    );
  }

  Widget buildEmailField() {
    return Column(
      children: <Widget>[
        StreamBuilder<String> (
          stream: authBloc.emailOut,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (text) => authBloc.emailIn.add(text),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: capitalize(email_text),
                  errorText: snapshot.hasError ? snapshot.error : null
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: def_padding),
        ),
      ],
    );
  }


  Widget buildPasswordField() {
    return Column(
      children: <Widget>[
        StreamBuilder<String> (
          stream: authBloc.passwordOut,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return TextField(
              obscureText: true,
              onChanged: (text) => authBloc.passwordIn.add(text),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: capitalize(password_text),
                  errorText: snapshot.hasError ? snapshot.error : null
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: def_padding),
        ),
      ],
    );
  }

  Widget buildSubmitBtn(BuildContext context) {
    return FlatButton(
          color: Theme.of(context).primaryColor,
          onPressed: () {
            isLogin ? authBloc.onSubmit.add(LoginEvent()) : authBloc.onSubmit.add(SignUpEvent());
          },
          child: Text(isLogin ? login_text.toUpperCase() : sign_up_text.toUpperCase(), style: Theme.of(context).textTheme.button),
        );
  }

}
