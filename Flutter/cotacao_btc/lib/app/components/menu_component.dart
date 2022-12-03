import 'package:flutter/material.dart';

import '../../main.dart';
import '../screens/list_currencies_screens.dart';

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

          // ListTile(
          //   leading: const Icon(Icons.house),
          //   title: const Text('Home Screen'),
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => MyHomeScreen(title: 'Home'))
          //     );
          //   },
          // ),

          ListTile(
            leading: const Icon(Icons.house),
            title: const Text('Home Screen'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListCurrencies(title: 'Home'))
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.house),
            title: const Text('List Currencies'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListCurrencies(title: 'Home'))
              );
            },
          ),
        ],
      ),
    );
}