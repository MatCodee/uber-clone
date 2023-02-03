
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider {
  FirebaseAuth? _firebaseAuth;


  AuthProvider() {
    _firebaseAuth = FirebaseAuth.instance;
  }

  User? getUser() {
    return _firebaseAuth!.currentUser;
  }

  void checkIfUserIsLogged(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if(user != null) {
        Navigator.pushNamed(context, 'client/map');
      }
    });
  }

  Future<bool> login(String email,String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return false;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return false;
      }
    }
    return true;
  }

  Future<bool> register(String username,String email,String pass,String cpass) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return false;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return false;
      }
    } catch (e) {
      print(e);
    }
    return true;
  }

  
}
