import 'package:flutter/material.dart';
import 'package:hangomamobile/core/router/router.dart';
import 'package:hangomamobile/provider/remote/login_provider.dart';
import 'package:hangomamobile/provider/remote/register_provider.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => RegisterProvider(),),
    ChangeNotifierProvider(create: (context) => LoginProvider(),)
  ],child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.route.onGenerate,
      initialRoute: 'splash',
    );
  }
}