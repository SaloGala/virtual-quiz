import 'package:flutter/material.dart';
import 'package:virtual_quiz/clues/Clues.dart';
import 'package:virtual_quiz/utilities/ProgressHelper.dart';

class AddressTabPage extends StatefulWidget {
  AddressTabPage({Key key, this.colorCase}) : super(key: key);

  String colorCase;

  @override
  AddressTabPageState createState() => new AddressTabPageState();
}

class AddressTabPageState extends State<AddressTabPage> {
  bool isCompleted = false;

  double fontSize1 = 35.0;
  double fontSizeAlert = 30.0;
  double fontSizeAlert2 = 20.0;

  final TextEditingController _streetController = new TextEditingController();
  final TextEditingController _numberController = new TextEditingController();
  final TextEditingController _cityController = new TextEditingController();
  final TextEditingController _stateController = new TextEditingController();

  @override
  void initState() {
    isCompleted = new ProgressHelper().getIsCompleted();
  }

  @override
  Widget build(BuildContext context) {
    Color color = _getColor();

    Widget lastView;

    if (isCompleted) {
      lastView = new Center(
        child: new Column(
          children: <Widget>[
            new Text(
              'Has resuelto el caso exitosamente, la dirección del sospechoso es:',
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 25.0,
              ),
            ),
            new Text(
              Clues.allClues[widget.colorCase + 'Address']['calle']
                      ['responseToShow'] +
                  ' #' +
                  Clues.allClues[widget.colorCase + 'Address']['numero']
                      .toString() +
                  ', ' +
                  Clues.allClues[widget.colorCase + 'Address']['ciudad']
                      ['responseToShow'] +
                  ', ' +
                  Clues.allClues[widget.colorCase + 'Address']['estado']
                      ['responseToShow'],
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 40.0,
              ),
            ),
            new Container()
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
      );
    } else {
      lastView = new Column(
        children: <Widget>[
          new Text(
            '¿Cuál es la dirección de tu sospechoso?',
            style: new TextStyle(fontSize: fontSize1),
          ),
          new Row(
            children: <Widget>[
              new Flexible(
                child: new Container(
                  child: new TextField(
                    controller: _streetController,
                    decoration: new InputDecoration(labelText: 'Calle'),
                    style: new TextStyle(
                      fontSize: fontSize1,
                      color: Colors.black,
                    ),
                  ),
                  padding: new EdgeInsets.only(left: 15.0, right: 15.0),
                ),
              ),
              new Flexible(
                child: new Container(
                  child: new TextField(
                    controller: _numberController,
                    decoration: new InputDecoration(labelText: 'Número'),
                    style: new TextStyle(
                      fontSize: fontSize1,
                      color: Colors.black,
                    ),
                  ),
                  padding: new EdgeInsets.only(left: 15.0, right: 15.0),
                ),
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              new Flexible(
                child: new Container(
                  child: new TextField(
                    controller: _cityController,
                    decoration: new InputDecoration(labelText: 'Ciudad'),
                    style: new TextStyle(
                      fontSize: fontSize1,
                      color: Colors.black,
                    ),
                  ),
                  padding: new EdgeInsets.only(left: 15.0, right: 15.0),
                ),
              ),
              new Flexible(
                child: new Container(
                  child: new TextField(
                    controller: _stateController,
                    decoration: new InputDecoration(labelText: 'Estado'),
                    style: new TextStyle(
                      fontSize: fontSize1,
                      color: Colors.black,
                    ),
                  ),
                  padding: new EdgeInsets.only(left: 15.0, right: 15.0),
                ),
              ),
            ],
          ),
          new RaisedButton(
            onPressed: () {
              _validateAddress();
            },
            child: new Text(
              'VER RESULTADO',
              style: new TextStyle(color: Colors.white, fontSize: fontSize1),
            ),
            color: color,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      );
    }

    return lastView;
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

  void _validateAddress() {
    int validityStreet = 0;
    int validityNumber = 0;
    int validityCity = 0;
    int validityState = 0;

    List valuesStreet =
        Clues.allClues[widget.colorCase + 'Address']['calle']['responses'];

    List valuesCity =
        Clues.allClues[widget.colorCase + 'Address']['ciudad']['responses'];

    List valuesState =
        Clues.allClues[widget.colorCase + 'Address']['estado']['responses'];

    for (int i = 0; i < valuesStreet.length; i++) {
      if (_streetController.text.toLowerCase() == valuesStreet[i]) {
        validityStreet = 1;
        break;
      }
    }

    if (_numberController.text ==
        Clues.allClues[widget.colorCase + 'Address']['numero'].toString()) {
      validityNumber = 1;
    }

    for (int i = 0; i < valuesCity.length; i++) {
      if (_cityController.text.toLowerCase() == valuesCity[i]) {
        validityCity = 1;
        break;
      }
    }

    for (int i = 0; i < valuesState.length; i++) {
      if (_stateController.text.toLowerCase() == valuesState[i]) {
        validityState = 1;
        break;
      }
    }

    if (validityStreet == 1 &&
        validityNumber == 1 &&
        validityCity == 1 &&
        validityState == 1) {
      print('Correcto...');

      showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text(
            '¡Felicidades!',
            style: new TextStyle(fontSize: fontSizeAlert),
          ),
          content: new Text(
            'Has resuelto el caso exitosamente',
            style: new TextStyle(fontSize: fontSizeAlert2),
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

      new ProgressHelper().setIsCompleted(true);
      setState(() {
        isCompleted = true;
      });
    } else {
      print('Incorrecto');

      showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text(
            'Incorrecto',
            style: new TextStyle(fontSize: fontSizeAlert),
          ),
          content: new Text(
            'La dirección que has introducido es incorrecta, por favor vuelve a intentarlo',
            style: new TextStyle(fontSize: fontSizeAlert2),
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
}
