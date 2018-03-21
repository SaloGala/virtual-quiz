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
                            child: new GestureDetector(
                              onTap: () {
                                showPhoto(context, 'Sospechoso 1', 's1');
                              },
                              child: new Hero(
                                tag: 'Sospechoso 1',
                                child: new Image.asset(
                                  'assets/' + widget.colorCase + '/s1.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
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
                            child: new GestureDetector(
                              onTap: () {
                                showPhoto(context, 'Sospechoso 2', 's2');
                              },
                              child: new Hero(
                                tag: 'Sospechoso 2',
                                child: new Image.asset(
                                  'assets/' + widget.colorCase + '/s2.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
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
                            child: new GestureDetector(
                              onTap: () {
                                showPhoto(context, 'Sospechoso 3', 's3');
                              },
                              child: new Hero(
                                tag: 'Sospechoso 3',
                                child: new Image.asset(
                                  'assets/' + widget.colorCase + '/s3.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
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
                            child: new GestureDetector(
                              onTap: () {
                                showPhoto(context, 'Sospechoso 4', 's4');
                              },
                              child: new Hero(
                                tag: 'Sospechoso 4',
                                child: new Image.asset(
                                  'assets/' + widget.colorCase + '/s4.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
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
                child: new GestureDetector(
                  onTap: () {
                    showPhoto(
                      context,
                      'Sospechoso ' + selectedSuspicious.toString(),
                      's' + selectedSuspicious.toString(),
                    );
                  },
                  child: new Hero(
                    tag: 'Sospechoso ' + selectedSuspicious.toString(),
                    child: new Image.asset(
                      'assets/' +
                          widget.colorCase +
                          '/s' +
                          selectedSuspicious.toString() +
                          '.png',
                      fit: BoxFit.fill,
                    ),
                  ),
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
            ),
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

  void showPhoto(BuildContext context, String title, String lastPathPart) {
    Navigator.push(context,
        new MaterialPageRoute<Null>(builder: (BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
          backgroundColor: _getColor(),
        ),
        body: new SizedBox.expand(
          child: new Hero(
            tag: title,
            child: new GridPhotoViewer(
              title: title,
              colorCase: widget.colorCase,
              lastPathPart: lastPathPart,
            ),
          ),
        ),
      );
    }));
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

const double _kMinFlingVelocity = 800.0;

class GridPhotoViewer extends StatefulWidget {
  const GridPhotoViewer(
      {Key key, this.title, this.colorCase, this.lastPathPart})
      : super(key: key);

  final String title;
  final String colorCase;
  final String lastPathPart;

  @override
  _GridPhotoViewerState createState() => new _GridPhotoViewerState();
}

class _GridPhotoViewerState extends State<GridPhotoViewer>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _flingAnimation;
  Offset _offset = Offset.zero;
  double _scale = 1.0;
  Offset _normalizedOffset;
  double _previousScale;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(vsync: this)
      ..addListener(_handleFlingAnimation);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // The maximum offset value is 0,0. If the size of this renderer's box is w,h
  // then the minimum offset value is w - _scale * w, h - _scale * h.
  Offset _clampOffset(Offset offset) {
    final Size size = context.size;
    final Offset minOffset =
        new Offset(size.width, size.height) * (1.0 - _scale);
    return new Offset(
        offset.dx.clamp(minOffset.dx, 0.0), offset.dy.clamp(minOffset.dy, 0.0));
  }

  void _handleFlingAnimation() {
    setState(() {
      _offset = _flingAnimation.value;
    });
  }

  void _handleOnScaleStart(ScaleStartDetails details) {
    setState(() {
      _previousScale = _scale;
      _normalizedOffset = (details.focalPoint - _offset) / _scale;
      // The fling animation stops if an input gesture starts.
      _controller.stop();
    });
  }

  void _handleOnScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      _scale = (_previousScale * details.scale).clamp(1.0, 4.0);
      // Ensure that image location under the focal point stays in the same place despite scaling.
      _offset = _clampOffset(details.focalPoint - _normalizedOffset * _scale);
    });
  }

  void _handleOnScaleEnd(ScaleEndDetails details) {
    final double magnitude = details.velocity.pixelsPerSecond.distance;
    if (magnitude < _kMinFlingVelocity) return;
    final Offset direction = details.velocity.pixelsPerSecond / magnitude;
    final double distance = (Offset.zero & context.size).shortestSide;
    _flingAnimation = new Tween<Offset>(
            begin: _offset, end: _clampOffset(_offset + direction * distance))
        .animate(_controller);
    _controller
      ..value = 0.0
      ..fling(velocity: magnitude / 1000.0);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onScaleStart: _handleOnScaleStart,
      onScaleUpdate: _handleOnScaleUpdate,
      onScaleEnd: _handleOnScaleEnd,
      child: new ClipRect(
        child: new Transform(
          transform: new Matrix4.identity()
            ..translate(_offset.dx, _offset.dy)
            ..scale(_scale),
          child: new Image.asset(
            'assets/' + widget.colorCase + '/' + widget.lastPathPart + '.png',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
