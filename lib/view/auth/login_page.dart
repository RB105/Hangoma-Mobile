import 'package:flutter/material.dart';
import 'package:hangomamobile/provider/remote/login_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Login",
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: TextFormField(
                  style: const TextStyle(fontSize: 17),
                  controller: context.watch<LoginProvider>().emailController,
                  decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 3),
                          borderRadius: BorderRadius.circular(20)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 3),
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: TextFormField(
                  style: const TextStyle(fontSize: 17),
                  controller: context.watch<LoginProvider>().passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 3),
                          borderRadius: BorderRadius.circular(20)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 3),
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                context.read<LoginProvider>().login(context);
              },
              label: const Text("Sign in")),
        );
      },
    );
  }
}
