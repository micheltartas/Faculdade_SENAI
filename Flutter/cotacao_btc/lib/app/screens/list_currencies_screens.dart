import 'package:cotacao_btc/app/components/menu_component.dart';
import 'package:flutter/material.dart';

class ListCurrencies extends StatefulWidget {
  const ListCurrencies({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ListCurrencies> createState() => _ListCurrenciesState();
}

class _ListCurrenciesState extends State<ListCurrencies> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      
      drawer: 
      MenuComponent(context),
      
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // const Text(
            //   'You have pushed the button this many times:',
            // ),

            ListTile(
              leading: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 44,
                  minHeight: 44,
                  maxWidth: 64,
                  maxHeight: 64,
                ),
                child: Image.asset('assets/imagens-moedas/AUD.png', fit: BoxFit.cover),
              ),
              title: Text('R\$: '),
              trailing: Icon(
                  Icons.cabin,
                  color: Colors.red
              ),
              onTap: () {
                setState(() {

                });
              },
            ),

            ListTile(
              leading: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 44,
                  minHeight: 44,
                  maxWidth: 64,
                  maxHeight: 64,
                ),
                child: Image.asset('assets/imagens-moedas/BRL.png', fit: BoxFit.cover),
              ),
              title: Text('R\$: '),
              trailing: Icon(
                  Icons.cabin,
                  color: Colors.red
              ),
              onTap: () {
                setState(() {

                });
              },
            ),

            ListTile(
              leading: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 44,
                  minHeight: 44,
                  maxWidth: 64,
                  maxHeight: 64,
                ),
                child: Image.asset('assets/imagens-moedas/CAD.png', fit: BoxFit.cover),
              ),
              title: Text('R\$: '),
              trailing: Icon(
                  Icons.cabin,
                  color: Colors.red
              ),
              onTap: () {
                setState(() {

                });
              },
            ),

            ListTile(
              leading: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 44,
                  minHeight: 44,
                  maxWidth: 64,
                  maxHeight: 64,
                ),
                child: Image.asset('assets/imagens-moedas/CHF.png', fit: BoxFit.cover),
              ),
              title: Text('R\$: '),
              trailing: Icon(
                  Icons.cabin,
                  color: Colors.red
              ),
              onTap: () {
                setState(() {

                });
              },
            ),

            ListTile(
              leading: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 44,
                  minHeight: 44,
                  maxWidth: 64,
                  maxHeight: 64,
                ),
                child: Image.asset('assets/imagens-moedas/CNY.png', fit: BoxFit.cover),
              ),
              title: Text('R\$: '),
              trailing: Icon(
                  Icons.cabin,
                  color: Colors.red
              ),
              onTap: () {
                setState(() {

                });
              },
            ),

          ],
        ),
      ),


      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
