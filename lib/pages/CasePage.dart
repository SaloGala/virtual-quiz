import 'package:flutter/material.dart';


class CasePage extends StatefulWidget {
  CasePage({Key key, this.colorCase}) : super(key: key);

  final String colorCase;

  @override
  CasePageState createState() => new CasePageState();
}

class CasePageState extends State<CasePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.colorCase),
        backgroundColor: Colors.indigo[900],
      ),
      body: new Center(
        child: new Text(widget.colorCase),
      ),
    );
  }
}
