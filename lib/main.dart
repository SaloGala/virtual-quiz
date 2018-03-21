import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:virtual_quiz/pages/CasePage.dart';

void main() => runApp(new Levels());

class Levels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Virtual Quiz',
      home: new LevelsPage(title: 'Casos a resolver'),
    );
  }
}

class LevelsPage extends StatefulWidget {
  LevelsPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  LevelsPageState createState() => new LevelsPageState();
}

class LevelsPageState extends State<LevelsPage> {
  Scaffold levelsScaffold;

  static const channel =
      const MethodChannel('com.policiafederal.virtualquiz/general');

  @override
  Widget build(BuildContext context) {
    levelsScaffold = new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        backgroundColor: Colors.indigo[900],
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Flexible(
                  child: new Text(
                    'Selecciona un nivel:',
                    style: new TextStyle(
                        color: Colors.indigo[900],
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            new Container(
              height: 15.0,
            ),
            new Flexible(
              child: new Column(
                children: <Widget>[
                  /*new Container(
                    height: 3.0,
                    color: Colors.indigo[900],
                  ),*/
                  new Flexible(
                    child: new Text(
                      'Fácil',
                      style: new TextStyle(
                        color: Colors.indigo[900],
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  new Flexible(
                    child: new Card(
                      child: new Stack(
                        children: <Widget>[
                          new Container(
                            child: new Text(
                              'MORADO',
                              style: new TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            alignment: Alignment.center,
                          ),
                          new Material(
                            type: MaterialType.transparency,
                            child: new InkWell(
                              onTap: () {
                                _initCase('morado');
                              },
                            ),
                          ),
                        ],
                      ),
                      color: Colors.purple[300],
                    ),
                  ),
                  new Flexible(
                    child: new Card(
                      child: new Stack(
                        children: <Widget>[
                          new Container(
                            child: new Text(
                              'ROJO',
                              style: new TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            alignment: Alignment.center,
                          ),
                          new Material(
                            type: MaterialType.transparency,
                            child: new InkWell(
                              onTap: () {
                                _initCase('rojo');
                              },
                            ),
                          ),
                        ],
                      ),
                      color: Colors.red[300],
                    ),
                  ),
                  new Container(
                    height: 3.0,
                    color: Colors.indigo[900],
                  ),
                  new Flexible(
                    child: new Text(
                      'Intermedio',
                      style: new TextStyle(
                        color: Colors.indigo[900],
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  new Flexible(
                    child: new Card(
                      child: new Stack(
                        children: <Widget>[
                          new Container(
                            child: new Text(
                              'AZUL',
                              style: new TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            alignment: Alignment.center,
                          ),
                          new Material(
                            type: MaterialType.transparency,
                            child: new InkWell(
                              onTap: () {
                                _initCase('azul');
                              },
                            ),
                          ),
                        ],
                      ),
                      color: Colors.blue[300],
                    ),
                  ),
                  new Flexible(
                    child: new Card(
                      child: new Stack(
                        children: <Widget>[
                          new Container(
                            child: new Text(
                              'NARANJA',
                              style: new TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            alignment: Alignment.center,
                          ),
                          new Material(
                            type: MaterialType.transparency,
                            child: new InkWell(
                              onTap: () {
                                _initCase('naranja');
                              },
                            ),
                          ),
                        ],
                      ),
                      color: Colors.orange[300],
                    ),
                  ),
                  new Container(
                    height: 3.0,
                    color: Colors.indigo[900],
                  ),
                  new Flexible(
                    child: new Text(
                      'Difícil',
                      style: new TextStyle(
                        color: Colors.indigo[900],
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  new Flexible(
                    child: new Card(
                      child: new Stack(
                        children: <Widget>[
                          new Container(
                            child: new Text(
                              'AMARILLO',
                              style: new TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            alignment: Alignment.center,
                          ),
                          new Material(
                            type: MaterialType.transparency,
                            child: new InkWell(
                              onTap: () {
                                _initCase('amarillo');
                              },
                            ),
                          ),
                        ],
                      ),
                      color: Colors.yellow[300],
                    ),
                  ),
                  new Flexible(
                    child: new Card(
                      child: new Stack(
                        children: <Widget>[
                          new Container(
                            child: new Text(
                              'VERDE',
                              style: new TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            alignment: Alignment.center,
                          ),
                          new Material(
                            type: MaterialType.transparency,
                            child: new InkWell(
                              onTap: () {
                                _initCase('verde');
                              },
                            ),
                          ),
                        ],
                      ),
                      color: Colors.green[300],
                    ),
                  ),
                  /*new Container(
                    height: 3.0,
                    color: Colors.indigo[900],
                  ),*/
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
            ),
          ],
        ),
        padding: new EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
      ),
    );

    return new WillPopScope(
      child: levelsScaffold,
      onWillPop: () {
        showDialog<Null>(
          context: context,
          child: new AlertDialog(
            title: new Text('Salir'),
            content: new Text('¿Quieres salir de la aplicación?'),
            actions: <Widget>[
              new FlatButton(
                child: new Text('NO'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text('SALIR'),
                onPressed: () async {
                  try {
                    int qrCode = await channel.invokeMethod('exitApp');
                  } on PlatformException catch (e, s) {}
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _initCase(String colorCase) {
    Navigator.of(context).pushReplacement(
      new MaterialPageRoute(
        builder: (BuildContext context) {
          return new CasePage(colorCase: colorCase);
        },
      ),
    );
  }
}
