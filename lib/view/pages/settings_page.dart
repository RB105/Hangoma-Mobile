import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hangomamobile/provider/local/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings",),
      ),
      body: Column(
        children: [
          ChangeNotifierProvider(create: (context) => ThemeProvider(),builder: (context, child) {
            return ListTile(
            trailing: ElevatedButton(onPressed: (){
              context.read<ThemeProvider>().changeTheme(context);
            }, child: const Text("Change Theme")),
            title:  Text("Night Mode",style: Theme.of(context).textTheme.bodyMedium,),
            leading: const Icon(Icons.nightlight_round),
          );
          },)
        ],
      ),
    );
  }
}
