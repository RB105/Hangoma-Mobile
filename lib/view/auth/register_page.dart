import 'package:flutter/material.dart';
import 'package:hangomamobile/provider/remote/register_provider.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => RegisterProvider(),builder: (context, child) {
      return Scaffold(
        appBar: AppBar(title: const Text("Register"),),
      );
    },);
  }
}
