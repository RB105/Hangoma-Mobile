import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hangomamobile/core/widgets/show_message_helper.dart';

class RegisterProvider extends ChangeNotifier {
  // Controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //Variables
  bool isLoading = false;

  // To sign up logic . . .
  Future<void> register(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        isLoading = false;
        notifyListeners();
        Navigator.popAndPushNamed(context, '/');
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        isLoading = false;
        notifyListeners();
        showMessageHelper("Your password is weak");
      } else if (e.code == 'email-already-in-use') {
        isLoading = false;
        notifyListeners();
        showMessageHelper("Email already in use");
      } else {
        isLoading = false;
        notifyListeners();
        showMessageHelper("Something went wrong");
      }
    }
  }
}
