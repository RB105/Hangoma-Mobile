import 'package:flutter/material.dart';
import 'package:hangomamobile/provider/remote/register_provider.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => RegisterProvider(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Register"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: TextFormField(
                  style: const TextStyle(fontSize: 17),
                  controller: context.watch<RegisterProvider>().emailController,
                  decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: const TextStyle(),
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
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                  controller:
                      context.watch<RegisterProvider>().passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'login');
                    },
                    child: const Text("Login")),
                FloatingActionButton.extended(
                    onPressed: () {
                      context.read<RegisterProvider>().register(context);
                    },
                    label: const Text("Register")),
              ],
            ),
          ),
        );
      },
    );
  }
}
