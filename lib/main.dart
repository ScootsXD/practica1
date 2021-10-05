import 'package:flutter/material.dart';
import 'package:practica/src/screens/agregar_nota_screen.dart';
import 'package:practica/src/screens/intenciones_screen.dart';
import 'package:practica/src/screens/login_screen.dart';
import 'package:practica/src/screens/notas_screen.dart';
import 'package:practica/src/screens/opcion1_screen.dart';
import 'package:practica/src/screens/perfil_screen.dart';
import 'package:practica/src/screens/prueba_screen.dart';
import 'package:practica/src/screens/splash_screen.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      routes:
      {
        '/opc1' : (BuildContext context) => Opcion1Screen(),
        '/intenciones' : (BuildContext context) => intencionesScreen(),
        '/notas' : (BuildContext context) => NotasScreen(),
        '/agregar' : (BuildContext context) => AgregarNotaScreen(),
        '/perfil' : (BuildContext context) => PerfilScreen(),
        '/prueba' : (BuildContext context) => PruebaScreen(),
      },

      debugShowCheckedModeBanner: false,
      home: splashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget
{
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{
  int _counter = 0;

  void _incrementCounter()
  {
    setState(()
    {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
