import 'package:flutter/material.dart';
import 'package:hangomamobile/provider/remote/login_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Login"),
          ),
        );
      },
    );
  }
}
