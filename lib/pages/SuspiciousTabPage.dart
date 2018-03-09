import 'package:flutter/material.dart';
import 'package:virtual_quiz/utilities/ProgressHelper.dart';

class SuspiciousTabPage extends StatefulWidget {
  SuspiciousTabPage({Key key, this.colorCase}) : super(key: key);

  String colorCase;

  @override
  SuspiciousTabPageState createState() => new SuspiciousTabPageState();
}

class SuspiciousTabPageState extends State<SuspiciousTabPage> {
  int selectedSuspicious;

  @override
  void initState() {
    selectedSuspicious = new ProgressHelper().getSelectedSuspicious();
  }

  @override
  Widget build(BuildContext context) {
    Widget body = _buildBody();
    return body;
  }

  Widget _buildBody() {
    Color color = _getColor();

    if (selectedSuspicious == 0) {
      return new Container(
        child: new Column(
          children: <Widget>[
            new Container(
              child: new Text(
                'Selecciona un sospechoso con base en las pistas que encontraste',
              ),
              margin: new EdgeInsets.all(5.0),
            ),
            new Container(
              child: new Text(
                'Presiona una imagen para hacer zoom en ella',
              ),
              margin: new EdgeInsets.all(5.0),
            ),
            new Expanded(
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Column(
                      children: <Widget>[
                        new Expanded(
                          child: new Container(
                            child: new Image.asset(
                              'assets/' + widget.colorCase + '/s1.png',
                              fit: BoxFit.fill,
                            ),
                            padding: new EdgeInsets.all(5.0),
                          ),
                        ),
                        new Container(
                          child: new RaisedButton(
                            onPressed: () {
                              _selectSuspicious(1);
                            },
                            child: new Text(
                              'Seleccionar',
                              style: new TextStyle(color: Colors.white),
                            ),
                            color: color,
                          ),
                          padding: new EdgeInsets.all(5.0),
                        ),
                      ],
                    ),
                  ),
                  new Expanded(
                    child: new Column(
                      children: <Widget>[
                        new Expanded(
                          child: new Container(
                            child: new Image.asset(
                              'assets/' + widget.colorCase + '/s2.png',
                              fit: BoxFit.fill,
                            ),
                            padding: new EdgeInsets.all(5.0),
                          ),
                        ),
                        new Container(
                          child: new RaisedButton(
                            onPressed: () {
                              _selectSuspicious(2);
                            },
                            child: new Text(
                              'Seleccionar',
                              style: new TextStyle(color: Colors.white),
                            ),
                            color: color,
                          ),
                          padding: new EdgeInsets.all(5.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            new Expanded(
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Column(
                      children: <Widget>[
                        new Expanded(
                          child: new Container(
                            child: new Image.asset(
                              'assets/' + widget.colorCase + '/s3.png',
                              fit: BoxFit.fill,
                            ),
                            padding: new EdgeInsets.all(5.0),
                          ),
                        ),
                        new Container(
                          child: new RaisedButton(
                            onPressed: () {
                              _selectSuspicious(3);
                            },
                            child: new Text(
                              'Seleccionar',
                              style: new TextStyle(color: Colors.white),
                            ),
                            color: color,
                          ),
                          padding: new EdgeInsets.all(5.0),
                        ),
                      ],
                    ),
                  ),
                  new Expanded(
                    child: new Column(
                      children: <Widget>[
                        new Expanded(
                          child: new Container(
                            child: new Image.asset(
                              'assets/' + widget.colorCase + '/s4.png',
                              fit: BoxFit.fill,
                            ),
                            padding: new EdgeInsets.all(5.0),
                          ),
                        ),
                        new Container(
                          child: new RaisedButton(
                            onPressed: () {
                              _selectSuspicious(4);
                            },
                            child: new Text(
                              'Seleccionar',
                              style: new TextStyle(color: Colors.white),
                            ),
                            color: color,
                          ),
                          padding: new EdgeInsets.all(5.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    } else {
      return new Center(
        child: new Column(
          children: <Widget>[
            new Container(
              child: new Text('Has seleccionado a un sospechoso:'),
              padding: new EdgeInsets.only(
                top: 20.0,
              ),
            ),
            new Expanded(
              child: new Container(
                child: new Image.asset(
                  'assets/' +
                      widget.colorCase +
                      '/s' +
                      selectedSuspicious.toString() +
                      '.png',
                  fit: BoxFit.fill,
                ),
                padding: new EdgeInsets.only(
                  top: 10.0,
                ),
              ),
            ),
            new Container(
              height: 5.0,
            ),
            new Container(
              child: new RaisedButton(
                onPressed: () {
                  _changeSuspicious();
                },
                child: new Text(
                  'Cambiar',
                  style: new TextStyle(color: Colors.white),
                ),
                color: color,
              ),
              padding: new EdgeInsets.only(
                top: 10.0,
                bottom: 20.0,
              ),
            )
          ],
        ),
      );
    }
  }

  void _selectSuspicious(int i) {
    new ProgressHelper().setSelectedSuspicious(i);

    setState(() {
      selectedSuspicious = i;
    });
  }

  void _changeSuspicious() {
    new ProgressHelper().setSelectedSuspicious(0);

    setState(() {
      selectedSuspicious = 0;
    });
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
}
