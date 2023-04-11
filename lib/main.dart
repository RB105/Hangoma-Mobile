import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hangomamobile/core/router/router.dart';
import 'package:hangomamobile/core/theme/dark_mode.dart';
import 'package:hangomamobile/core/theme/light_mode.dart';
import 'package:hangomamobile/provider/remote/login_provider.dart';
import 'package:hangomamobile/provider/remote/register_provider.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => RegisterProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => LoginProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: LightThemeMode.theme,
      dark: DarkThemeMode.theme,
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) {
        return MaterialApp(
          theme: theme,
          darkTheme: darkTheme,
          onGenerateRoute: RouteGenerator.route.onGenerate,
          debugShowCheckedModeBanner: false,
          initialRoute: 'splash',
        );
      },
    );
  }
}
