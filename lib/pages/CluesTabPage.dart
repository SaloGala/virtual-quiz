import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:virtual_quiz/utilities/ProgressHelper.dart';
import 'package:virtual_quiz/clues/Clues.dart';

class CluesTabPage extends StatefulWidget {
  CluesTabPage({Key key, this.colorCase}) : super(key: key);

  String colorCase;

  @override
  CluesTabPageState createState() => new CluesTabPageState();
}

class CluesTabPageState extends State<CluesTabPage> {
  double fontSize1 = 35.0;
  double fontSize2 = 40.0;
  double fontSizeAlert = 30.0;
  double fontSizeTitle = 40.0;
  double fontSizeAlert2 = 20.0;
  double fontSizeSubtitle = 20.0;
  double fontSizeQuestion = 30.0;

  static const channel =
      const MethodChannel('com.policiafederal.virtualquiz/general');

  final TextEditingController _controller = new TextEditingController();

  int cluesCount;
  String mainText;
  String secondaryText = '';
  Widget mainSpace;
  List cluesIDs;
  List cluesAnswered;

  @override
  void initState() {
    _initializeChannels();
    cluesCount = new ProgressHelper().getCluesCount();
    cluesIDs = new ProgressHelper().getCluesIDs();
    cluesAnswered = new ProgressHelper().getCluesAnswered();
  }

  @override
  Widget build(BuildContext context) {
    Widget body = _buildBody();
    return body;
  }

  Widget _buildBody() {
    Color color = _getColor();

    if (cluesCount == 0) {
      mainText = '';
      mainSpace = new Center(
        child: new Text(
          'Todavía no has encontrado ninguna pista',
          style: new TextStyle(fontSize: fontSize2),
        ),
      );
    } else {
      int totalClues = _getTotalClues();
      mainText = 'Has encontrado $cluesCount de $totalClues pistas';

      if (widget.colorCase == 'amarillo' || widget.colorCase == 'verde') {
        secondaryText = 'Has respondido correctamente ${cluesAnswered
            .length} de $totalClues preguntas';
      }
      mainSpace = new ListView.builder(
        itemCount: cluesIDs.length,
        itemBuilder: (BuildContext context, int index) {
          if (widget.colorCase == 'amarillo' || widget.colorCase == 'verde') {
            Widget actionWidget;
            if (cluesAnswered.contains(cluesIDs[index])) {
              actionWidget = new Text(
                'Respuesta correcta: ' +
                    Clues.allClues[widget.colorCase +
                        cluesIDs[index].toString()]['responseToShow'],
                style: new TextStyle(fontSize: fontSizeQuestion, color: Colors.green[400]),
              );
            } else {
              actionWidget = new RaisedButton(
                onPressed: () {
                  _answerQuestion(cluesIDs[index]);
                },
                child: new Text(
                  'Responder',
                  style: new TextStyle(
                      color: Colors.white, fontSize: fontSizeQuestion),
                ),
                color: color,
              );
            }

            return new Container(
              child: new Column(
                children: <Widget>[
                  new Container(
                    height: 3.0,
                    color: Colors.grey,
                  ),
                  new Container(
                    height: 20.0,
                  ),
                  new Text(
                    Clues.allClues[widget.colorCase +
                        cluesIDs[index].toString()]['question'],
                    style: new TextStyle(fontSize: fontSizeQuestion),
                  ),
                  new Container(
                    height: 20.0,
                  ),
                  actionWidget,
                  new Container(
                    height: 30.0,
                  ),
                ],
              ),
            );
          } else {
            return new Container(
              child: new Card(
                child: new Image.asset(
                  'assets/' +
                      widget.colorCase +
                      '/' +
                      cluesIDs[index].toString() +
                      '.png',
                  fit: BoxFit.fill,
                ),
              ),
              padding: new EdgeInsets.all(5.0),
            );
          }
        },
      );
    }

    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new Text(
              'Escanea los códigos QR a lo largo del museo para encontrar pistas sobre tu caso',
              textAlign: TextAlign.center,
              style: new TextStyle(fontSize: fontSize1),
            ),
            padding: new EdgeInsets.only(left: 10.0, right: 10.0),
          ),
          new Container(
            height: 25.0,
          ),
          new RaisedButton(
            onPressed: () {
              _scanQRCode();
            },
            child: new Text(
              'ESCANEAR CÓDIGO QR',
              style: new TextStyle(color: Colors.white, fontSize: fontSize1),
            ),
            color: color,
          ),
          new Container(
            height: 25.0,
          ),
          new Text(
            mainText,
            style: new TextStyle(fontSize: fontSize1),
          ),
          new Container(
            height: 25.0,
          ),
          new Text(
            secondaryText,
            style: new TextStyle(fontSize: fontSizeSubtitle),
          ),
          new Container(
            height: 25.0,
          ),
          new Flexible(
            child: new Center(
              child: mainSpace,
            ),
          )
        ],
      ),
      padding: new EdgeInsets.only(
        top: 20.0,
      ),
    );
  }

  void _initializeChannels() {
    channel.setMethodCallHandler((MethodCall methodCall) async {
      String method = methodCall.method;

      if (method == 'handleText') {
        String text = methodCall.arguments;
        print('Text from QR code is: $text');
        _addClue(text);
      }
    });
  }

  Future<Null> _scanQRCode() async {
    try {
      int qrCode = await channel.invokeMethod('scanQRCode');
    } on PlatformException catch (e, s) {}
  }

  _addClue(String text) {
    if (Clues.allClues[text] != null &&
        Clues.allClues[text]['type'] != 'info') {
      if (Clues.allClues[text]['type'] == widget.colorCase) {
        if (!cluesIDs.contains(Clues.allClues[text]['value'])) {
          int newCount = new ProgressHelper().getCluesCount() + 1;
          new ProgressHelper().setCluesCount(newCount);

          setState(() {
            cluesIDs.add(Clues.allClues[text]['value']);
            new ProgressHelper().setCluesIDs(cluesIDs);
            cluesCount = newCount;
          });
        } else {
          print('¡Ya tienes esta pista!');

          new Timer(
            new Duration(milliseconds: 500),
            () {
              showDialog<Null>(
                context: context,
                child: new AlertDialog(
                  title: new Text(
                    'Duplicada',
                    style: new TextStyle(fontSize: fontSizeTitle),
                  ),
                  content: new Text(
                    '¡Ya tienes esta pista!',
                    style: new TextStyle(fontSize: fontSizeAlert),
                  ),
                  actions: <Widget>[
                    new FlatButton(
                      child: new Text(
                        'ESCANEAR OTRO CÓDIGO',
                        style: new TextStyle(fontSize: fontSizeAlert2),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        _scanQRCode();
                      },
                    ),
                    new FlatButton(
                      child: new Text(
                        'ACEPTAR',
                        style: new TextStyle(fontSize: fontSizeAlert2),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              );
            },
          );
        }
      } else {
        print(
          'Esta pista no corresponde a tu caso, recuerda escanear códigos QR para el caso ${widget
              .colorCase}',
        );

        new Timer(
          new Duration(milliseconds: 500),
          () {
            showDialog<Null>(
              context: context,
              child: new AlertDialog(
                title: new Text(
                  'Desconocida',
                  style: new TextStyle(fontSize: fontSizeTitle),
                ),
                content: new RichText(
                  text: new TextSpan(
                    text:
                        'Esta pista no corresponde a tu caso, recuerda escanear códigos QR para el caso ',
                    style: new TextStyle(
                        //fontSize: 25.0,
                        color: Colors.grey[900],
                        fontSize: fontSizeAlert),
                    children: <TextSpan>[
                      new TextSpan(
                        text: widget.colorCase,
                        style: new TextStyle(
                          fontSize: fontSizeAlert,
                          //fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: _getColor(),
                        ),
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text(
                      'ESCANEAR OTRO CÓDIGO',
                      style: new TextStyle(fontSize: fontSizeAlert2),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      _scanQRCode();
                    },
                  ),
                  new FlatButton(
                    child: new Text(
                      'ACEPTAR',
                      style: new TextStyle(fontSize: fontSizeAlert2),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          },
        );
      }
    } else {
      //print('No se encontró ninguna pista');

      new Timer(
        new Duration(milliseconds: 500),
        () {
          showDialog<Null>(
            context: context,
            child: new AlertDialog(
              title: new Text(
                'Ninguna pista',
                style: new TextStyle(fontSize: fontSizeTitle),
              ),
              content: new Text(
                'No se encontró ninguna pista para el código escaneado',
                style: new TextStyle(fontSize: fontSizeAlert),
              ),
              actions: <Widget>[
                new FlatButton(
                  child: new Text(
                    'ESCANEAR OTRO CÓDIGO',
                    style: new TextStyle(fontSize: fontSizeAlert2),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    _scanQRCode();
                  },
                ),
                new FlatButton(
                  child: new Text(
                    'ACEPTAR',
                    style: new TextStyle(fontSize: fontSizeAlert2),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
      );
    }
  }

  Color _getColor() {
    if (widget.colorCase == 'morado') {
      return Colors.purple[300];
    } else if (widget.colorCase == 'rojo') {
      return Colors.red[300];
    } else if (widget.colorCase == 'azul') {
      return Colors.blue[300];
    } else if (widget.colorCase == 'naranja') {
      return Colors.orange[300];
    } else if (widget.colorCase == 'amarillo') {
      return Colors.yellow[300];
    } else {
      return Colors.green[300];
    }
  }

  int _getTotalClues() {
    if (widget.colorCase == 'morado') {
      return Clues.allClues['moradoTotal']['value'];
    } else if (widget.colorCase == 'rojo') {
      return Clues.allClues['rojoTotal']['value'];
    } else if (widget.colorCase == 'azul') {
      return Clues.allClues['azulTotal']['value'];
    } else if (widget.colorCase == 'naranja') {
      return Clues.allClues['naranjaTotal']['value'];
    } else if (widget.colorCase == 'amarillo') {
      return Clues.allClues['amarilloTotal']['value'];
    } else {
      return Clues.allClues['verdeTotal']['value'];
    }
  }

  void _answerQuestion(int clueID) {
    showDialog(
      context: context,
      child: new _SystemPadding(
        child: new AlertDialog(
          actions: <Widget>[
            new FlatButton(
              onPressed: () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                }
              },
              child: new Text(
                'CANCELAR',
                style: new TextStyle(fontSize: fontSizeAlert2),
              ),
            ),
            new FlatButton(
              onPressed: () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();

                  List values =
                      Clues.allClues[widget.colorCase + clueID.toString()]
                          ['responses'];

                  int validity = 0;

                  for (int i = 0; i < values.length; i++) {
                    if (_controller.text.toLowerCase() == values[i]) {
                      validity = 1;
                      break;
                    }
                  }

                  _controller.text = '';

                  if (validity == 1) {
                    List tempAnsweredClues;
                    tempAnsweredClues = new ProgressHelper().getCluesAnswered();
                    tempAnsweredClues.add(clueID);
                    new ProgressHelper().setCluesAnswered(tempAnsweredClues);
                    setState(() {
                      cluesAnswered = tempAnsweredClues;
                    });

                    showDialog(
                      context: context,
                      child: new AlertDialog(
                        title: new Text(
                          'Correcto',
                          style: new TextStyle(fontSize: fontSizeTitle),
                        ),
                        content: new Text(
                          'Tienes una nueva pista',
                          style: new TextStyle(fontSize: fontSizeAlert),
                        ),
                        actions: <Widget>[
                          new FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: new Text(
                              'ACEPTAR',
                              style: new TextStyle(fontSize: fontSizeAlert2),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    print('Incorrecto');

                    showDialog(
                      context: context,
                      child: new AlertDialog(
                        title: new Text(
                          'Incorrecto',
                          style: new TextStyle(fontSize: fontSizeTitle),
                        ),
                        content: new Text(
                          'Por favor verifica tu respuesta',
                          style: new TextStyle(fontSize: fontSizeAlert),
                        ),
                        actions: <Widget>[
                          new FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: new Text(
                              'ACEPTAR',
                              style: new TextStyle(fontSize: fontSizeAlert2),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                }
              },
              child: new Text(
                'CALIFICAR',
                style: new TextStyle(fontSize: fontSizeAlert2),
              ),
            )
          ],
          title: new Text(
            Clues.allClues[widget.colorCase + clueID.toString()]['question'],
            style: new TextStyle(fontSize: fontSize1),
          ),
          content: new TextField(
            autofocus: true,
            controller: _controller,
            decoration: new InputDecoration(
              hintText: 'Respuesta',
            ),
          ),
        ),
      ),
    );
  }
}

class _SystemPadding extends StatelessWidget {
  final Widget child;

  _SystemPadding({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return new AnimatedContainer(
        padding: mediaQuery.viewInsets,
        duration: const Duration(milliseconds: 300),
        child: child);
  }
}
