import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VideoTabPage extends StatefulWidget {
  VideoTabPage({Key key, this.colorCase}) : super(key: key);

  String colorCase;

  @override
  VideoTabPageState createState() => new VideoTabPageState();
}

class VideoTabPageState extends State<VideoTabPage> {

  double fontSize1 = 45.0;

  static const channel =
      const MethodChannel('com.policiafederal.virtualquiz/general');

  @override
  Widget build(BuildContext context) {
    Color color = _getColor();

    return new Container(
      child: new Center(
        child: new Column(
          children: <Widget>[
            new RichText(
              text: new TextSpan(
                text: 'Mira el video del caso ',
                style: new TextStyle(
                  fontSize: fontSize1,
                  color: Colors.grey[900],
                ),
                children: <TextSpan>[
                  new TextSpan(
                    text: widget.colorCase,
                    style: new TextStyle(
                      fontSize: fontSize1,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  new TextSpan(
                    text:
                        ' al inicio del recorrido en el museo. \n\nSi necesitas volverlo a ver, puedes hacerlo en cualquier momento a aquí:',
                    style: new TextStyle(
                      fontSize: fontSize1,
                      color: Colors.grey[900],
                    ),
                  ),
                ],
              ),
            ),
            new RaisedButton(
              child: new Text(
                'VER VIDEO',
                style: new TextStyle(
                  fontSize: fontSize1,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                _playVideo();
              },
              color: color,
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
      ),
      padding: new EdgeInsets.all(15.0),
    );
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

  Future _playVideo() async {
    Map params = {'caseColor': widget.colorCase};
    print('Params are: ' + params.toString());
    try {
      await channel.invokeMethod('openVideo', params);
    } on PlatformException catch (e, s) {}
  }
}
