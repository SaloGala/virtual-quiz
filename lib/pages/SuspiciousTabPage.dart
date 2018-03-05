import 'package:flutter/material.dart';

class SuspiciousTabPage extends StatefulWidget {
  SuspiciousTabPage({Key key, this.colorCase}) : super(key: key);

  String colorCase;

  @override
  SuspiciousTabPageState createState() => new SuspiciousTabPageState();
}

class SuspiciousTabPageState extends State<SuspiciousTabPage> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('Esta es la tab Sospechoso del caso ${widget.colorCase}'),
    );
  }
}
