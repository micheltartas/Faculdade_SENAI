import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import '../components/menu_component.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Calculadora> createState() => _Calculadora();
}

class _Calculadora extends State<Calculadora> {
  List<String> listaResultados = [];

  double _valor1 = 0;
  double _valor2 = 0;
  double _resultado = 0;

  TextEditingController valorUmController = TextEditingController();
  TextEditingController valorDoisController = TextEditingController();

  void _somar() {
    setState(() {
      _resultado = 0;
      _valor1 = double.parse(valorUmController.text);
      _valor2 = double.parse(valorDoisController.text);
      _resultado = _valor1 + _valor2;

      listaResultados.add(_resultado.toStringAsFixed(2));
    });
  }

  void _subtrair() {
    setState(() {
      _resultado = 0;
      _valor1 = double.parse(valorUmController.text);
      _valor2 = double.parse(valorDoisController.text);
      _resultado = _valor1 - _valor2;

      listaResultados.add(_resultado.toStringAsFixed(2));
    });
  }

  void _multiplicar() {
    setState(() {
      _resultado = 0;
      _valor1 = double.parse(valorUmController.text);
      _valor2 = double.parse(valorDoisController.text);
      _resultado = _valor1 * _valor2;

      listaResultados.add(_resultado.toStringAsFixed(2));
    });
  }

  void _dividir() {
    setState(() {
      _resultado = 0;
      _valor1 = double.parse(valorUmController.text);
      _valor2 = double.parse(valorDoisController.text);
      _resultado = _valor1 / _valor2;

      listaResultados.add(_resultado.toStringAsFixed(2));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: MenuComponent(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              controller: valorUmController,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Valor 1',
                hintStyle: TextStyle(color: Colors.blue),
              ),
            ),
            TextField(
              controller: valorDoisController,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Valor 2',
                hintStyle: TextStyle(color: Colors.blue),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(onPressed: _somar, child: const Text('+')),
                OutlinedButton(onPressed: _subtrair, child: const Text('-')),
                OutlinedButton(onPressed: _dividir, child: const Text('/')),
                OutlinedButton(onPressed: _multiplicar, child: const Text('*')),
              ],
            ),
            ListTile(
              title: Text('Resultado: IMC: ' + _resultado.toStringAsFixed(2)),
              trailing: Icon(Icons.delete, color: Colors.red),
              onTap: () {
                setState(() {
                  _resultado = 0;
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: listaResultados.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(listaResultados[index].toString()),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            listaResultados.remove(listaResultados[index]);
                          });
                        },
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
