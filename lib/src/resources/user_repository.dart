import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {

  Future<FirebaseUser> login(String email, String password) async {
    return FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<FirebaseUser> signUp(String email, String password) {
    return FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  }

}