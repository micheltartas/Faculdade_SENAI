import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculadora de IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _peso = 0;
  double _altura = 0;
  double _imc =0;
  String _imcTexto = '';

  TextEditingController pesoController    = TextEditingController();
  TextEditingController alturaController  = TextEditingController();

  void _calcularIMC(){
    setState(() {
      _peso   = double.parse(pesoController.text);
      _altura = double.parse(alturaController.text);
      _imc = 10000 * (_peso/((_altura * _altura)));
      _imcTexto = resultadoIMC(_imc);
    });
  }

  String resultadoIMC(double imc) {
    if (imc <= 19){
      return "Abaixo do Peso";
    } else if (imc <= 25) {
      return "Peso ideal";
    } else if (imc <= 30) {
      return "Acima do Peso";
    } else if (imc <= 35){
      return "Obesidade Leve";
    } else{
      return "Obesidade";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            const Icon(
              Icons.balance,
              color: Colors.blue,
              size: 150.0,
            ),

            TextField(
              keyboardType: TextInputType.number,
              controller: pesoController,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Peso(kg)',
                hintStyle: TextStyle(color: Colors.blue),
              ),
            ),

            TextField(
              controller: alturaController,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Altura(cm)',
                hintStyle: TextStyle(color: Colors.blue),
              ),
            ),

            OutlinedButton(onPressed: _calcularIMC, child: const Text('Calcular')),

            const Padding(
              padding: EdgeInsets.all(15), //apply padding to all four sides
              child:
              Text("Informe seus dados!"),
            ),

            ListTile(
              title: Text('Resultado: IMC: ' + _imc.toStringAsFixed(2)),
              trailing: Icon(
                Icons.delete,
                color: Colors.red
              ),
              onTap: () {
                setState(() {
                  _imc = 0;
                });
              },
            ),

            ListTile(
              title: Text('Estado: ' + _imcTexto),
              trailing: Icon(
                  Icons.delete,
                  color: Colors.red
              ),
              onTap: () {
                setState(() {
                  _imcTexto = '';
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
