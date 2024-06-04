import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oop/presentation/views/bottom_nav_bar.dart';
import 'package:oop/presentation/views/login.dart';

class FireAuth {
  User? user;
  FirebaseAuth auth = FirebaseAuth.instance;
  static String usedEmail = '';

  void registerUser(BuildContext context,{required String email, required String password}) async {
    try {
      UserCredential register = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if(register.user != null && context.mounted){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogIn(),));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        usedEmail = 'email is already in use';
      }
    }
  }

  void logInUser(BuildContext context,
      {required String email, required String password}) async {
    try {
      UserCredential signIn = await auth.signInWithEmailAndPassword(email: email, password: password);
      if(signIn.user != null && context.mounted){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomNavBar(),));
      }
    } on FirebaseAuthException{
      if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('incorrect password or email'),
            duration: Duration(seconds: 4),
          ));
      }
    } on RecaptchaVerifierOnError catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('ignore $e'),
          duration: const Duration(seconds: 4),
        ));
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Something went wrong'),
          duration: Duration(seconds: 4),
        ));
      }
    }
  }
}
