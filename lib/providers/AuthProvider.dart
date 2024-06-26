import 'package:deshi_mart/configs/CustomNotication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthProvider extends ChangeNotifier {
  final auth = FirebaseAuth.instance;

  bool isLoading = false;

  Future<void> loginWithEmailPwd(
      String email, String password, BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      successMessage(context, "Login Success");
      context.go("/home");
    } catch (ex) {
      errorMessage(context, ex.toString());
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> logout(BuildContext context) async {
    try {
      await auth.signOut();
      successMessage(context, "Done");
      context.go("/auth");
    } catch (ex) {
      errorMessage(context, ex.toString());
    }
  }
}
