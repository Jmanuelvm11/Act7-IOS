import 'package:flutter/material.dart';
import 'package:luhi/route_generator.dart';

void main() => runApp(ValenzuelaApp());

class ValenzuelaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ruteo',
      initialRoute: "/",
      home: PageOne(),
      onGenerateRoute: RouteGenerator.generateRoute,
    ); //Fin MaterialApp
  } //Fin de Widget
} //Fin Clase ValenzuelaApp

class PageOne extends StatelessWidget {
  String _params = "hola desde pagina uno";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  PageOne({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key al a scaffold para acceder al scaffold desde otro widget hijo
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Primera Pagina de Valenzuela'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Container(
          child: MaterialButton(
            child: Text(
              "Siguiente Pagina",
              style: TextStyle(
                color: Colors.blue[70],
              ),
            ),
            color: Colors.red,
            onPressed: () {
              _openSecondPage(context);
            },
          ),
        ),
      ),
    );
  }

  void _openSecondPage(BuildContext context) async {
    String _datoRetornadoDeSecondPage;
    // await para esperar que se regrese dato desde la pantalla que se abre
    await Navigator.of(context)
        .pushNamed(
      "/secondPage",
      arguments: _params,
    )
        .then(
      (response) {
        _datoRetornadoDeSecondPage = response;
      },
    );
    // acceso al scaffold para mostrar snackbar
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          "Texto regresado: $_datoRetornadoDeSecondPage",
        ),
      ), //Fin Snack Bar
    ); //Fin _Scaffold key
  } //Fin void
} //Fin Clase Page One
