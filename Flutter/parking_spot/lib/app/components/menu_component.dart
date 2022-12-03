import 'package:flutter/material.dart';

import '../screens/create_screen.dart';
import '../screens/home_screen.dart';

Widget MenuComponent(BuildContext context){
  return
    Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Menu'),
          ),

          ListTile(
            leading: const Icon(Icons.house),
            title: const Text('Home Screen'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: 'Home'))
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.house),
            title: const Text('Create'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreatePage(title: 'Cadastrar Vaga'))
              );
            },
          ),
        ],
      ),
    );
}