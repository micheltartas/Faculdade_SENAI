import 'package:calculadora_imc/apps/screens/calculadoraComTeclado_screen.dart';
import 'package:flutter/material.dart';

import '../screens/calculadora_screen.dart';
import '../screens/calculadoraIMC_screen.dart';
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
                  MaterialPageRoute(builder: (context) => HomeScreen(title: 'Home'))
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.balance),
            title: const Text('Calculadora de IMC'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalculadoraIMC(title: 'Calculadora IMC'))
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.calculate),
            title: const Text('Calculadora'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Calculadora(title: 'Calculadora'))
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.calculate),
            title: const Text('Calculadora Com Teclado'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalculadoraComTeclado(title: 'Calculadora Com Teclado'))
              );
            },
          ),
        ],
      ),
    );
}