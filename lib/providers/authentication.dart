import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication extends ChangeNotifier {
  Authentication._() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      notifyListeners();
    });
  }
  factory Authentication() => Authentication._();
  User? user = FirebaseAuth.instance.currentUser;
  login(String email, String password) async {
    //login here
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  register(String email, String password) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  setName(String username) async {
    await FirebaseAuth.instance.currentUser!.updateDisplayName(username);
  }

  getUser() {
    //fetch from db
  }
  update() {}
  delete() {}
}
