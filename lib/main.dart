import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Primeiro aplicativo em Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var _texto = '';

  void _incrementCounter() {
    setState(() {
      _texto = 'Você apertou o botão (+):';
      _counter++;
      if (_counter == 10) {
        _texto = 'Você não cansou de apertar o botão?';
      } else if (_counter == 20) {
        _texto = 'Descanse um pouco depois você continua!';
      } else if (_counter >= 30) {
        _texto = 'Você é insistente!';
      } else if (_counter < 0) {
        _texto = 'Continue a subir!';
      }
    });
  }

  void _incrementSubtract() {
    setState(() {
      _texto = 'Você diminuiu o numero, apertou o botão +:';
      if (_counter <= 0) {
        _texto = 'Você apertou o botão (-):';
      } else if (_counter == -10) {
        _texto = 'Você está indo na contra mão volte.';
      } else if (_counter == -20) {
        _texto = 'Quer continuar descendo?';
      } else if (_counter <= -30) {
        _texto = 'Você é insistente!';
      }
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: _counter < 0
            ? _counter <= -30
                ? Colors.red[50]
                : _counter <= -20
                    ? Colors.red[300]
                    : _counter <= -10
                        ? Colors.red[600]
                        : Colors.red[900]
            : _counter >= 30
                ? Colors.blue[900]
                : _counter >= 20
                    ? Colors.blue[600]
                    : _counter >= 10
                        ? Colors.blue[300]
                        : Colors.blue[50],
        title: Text(widget.title,
            style: TextStyle(
                color: _counter < 0
                    ? _counter <= -30
                        ? Colors.black
                        : _counter <= -20
                            ? Colors.black
                            : _counter <= -10
                                ? Colors.white
                                : Colors.white
                    : _counter >= 30
                        ? Colors.white
                        : _counter >= 20
                            ? Colors.white
                            : _counter >= 10
                                ? Colors.black
                                : Colors.black)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_texto',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton(
              onPressed: _incrementSubtract,
              tooltip: 'Subtrair',
              child: const Icon(Icons.minimize),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Somar +1',
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
