

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
           const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end:  Alignment.bottomLeft,
                colors: [Colors.blue, Colors.red]),
              color: Colors.green,
              //here's user profile picture also
            ),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title:  Text('Settings',style: Theme.of(context).textTheme.displayMedium,),
            onTap: ()  {
              Navigator.pushNamed(context,"settings");
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title:  Text('Logout',style: Theme.of(context).textTheme.displayMedium,),
            onTap: () async {
              Navigator.pushNamedAndRemoveUntil(context, 'register', (route) => false);
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
