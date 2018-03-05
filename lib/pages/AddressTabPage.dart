import 'package:flutter/material.dart';

class AddressTabPage extends StatefulWidget {
  AddressTabPage({Key key, this.colorCase}) : super(key: key);

  String colorCase;

  @override
  AddressTabPageState createState() => new AddressTabPageState();
}

class AddressTabPageState extends State<AddressTabPage> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('Esta es la tab Dirección del caso ${widget.colorCase}'),
    );
  }
}
