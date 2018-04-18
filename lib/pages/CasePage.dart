import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:virtual_quiz/pages/AddressTabPage.dart';
import 'package:virtual_quiz/pages/CluesTabPage.dart';
import 'package:virtual_quiz/pages/SuspiciousTabPage.dart';
import 'package:virtual_quiz/pages/VideoTabPage.dart';

class CasePage extends StatefulWidget {
  CasePage({Key key, this.colorCase}) : super(key: key);

  final String colorCase;

  @override
  CasePageState createState() => new CasePageState();
}

class CasePageState extends State<CasePage>
    with SingleTickerProviderStateMixin {
  static const channel =
      const MethodChannel('com.policiafederal.virtualquiz/general');
  Scaffold tabsScaffold;

  String step = 'Paso 1: Mira el video';
  double fontSizeToolbar = 40.0;
  double fontSizeAlert = 30.0;
  double fontSizeAlert2 = 20.0;

  TabController controller;

  @override
  initState() {
    super.initState();
    controller = new TabController(
      length: 4,
      vsync: this,
    );
    controller.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color color = _getColor();
    var body = _initBody();
    var bottomNavigationBar = _initBottomNavigationBar();

    tabsScaffold = new Scaffold(
      appBar: new AppBar(
        title: new Text(
          step,
          style: new TextStyle(fontSize: fontSizeToolbar),
        ),
        backgroundColor: color,
      ),
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );

    return new WillPopScope(
      child: tabsScaffold,
      onWillPop: () {
        print('Will pop');
        showDialog<Null>(
          context: context,
          child: new AlertDialog(
            title: new Text(
              'Salir',
              style: new TextStyle(
                fontSize: fontSizeAlert,
              ),
            ),
            content: new Text(
              '¿Quieres salir de la aplicación?',
              style: new TextStyle(fontSize: fontSizeAlert2),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text(
                  'NO',
                  style: new TextStyle(fontSize: fontSizeAlert2),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text(
                  'SALIR',
                  style: new TextStyle(fontSize: fontSizeAlert2),
                ),
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

  _initBody() {
    return new TabBarView(
      controller: controller,
      children: <Widget>[
        new VideoTabPage(colorCase: widget.colorCase),
        new CluesTabPage(colorCase: widget.colorCase),
        new SuspiciousTabPage(colorCase: widget.colorCase),
        new AddressTabPage(colorCase: widget.colorCase)
      ],
    );
  }

  Widget _initBottomNavigationBar() {
    var color = _getColor();

    var tabs = <Tab>[
      new Tab(icon: new Icon(Icons.videocam), text: 'Video'),
      new Tab(icon: new Icon(Icons.search), text: 'Pistas'),
      new Tab(icon: new Icon(Icons.person), text: 'Sospechoso'),
      new Tab(icon: new Icon(Icons.location_on), text: 'Dirección'),
    ];

    return new Material(
      color: color,
      child: new TabBar(
        controller: controller,
        tabs: tabs,
        labelStyle: new TextStyle(fontSize: 25.0),
      ),
    );
  }

  void _handleTabSelection() {
    var i = controller.index;
    String stepString;

    if (i == 0) {
      stepString = 'Mira el video';
    } else if (i == 1) {
      stepString = 'Busca las pistas';
    } else if (i == 2) {
      stepString = 'Identifica un sospechoso';
    } else {
      stepString = 'Encuentra la dirección';
    }
    setState(() {
      step = 'Paso ' + (i + 1).toString() + ': ' + stepString;
    });
  }
}
