import 'dart:math' as math;

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  bool isPressed = false;

  Animation<double> _animateIcon;
  Animation<Color> _animateColor;
  Animation<double> _translateButton;
  Animation<double> _translateButtonX2;
  Animation<double> _translateButtonY2;
  AnimationController _animationController;
  AnimationController _buttonController;
  Curve _curve = Curves.linear;
  double _fabHeight = 56.0;

  Animation<double> _translateButtonY3;

  Animation<double> _translateButtonX3;

  String text = "Floating Menu";

  Animation<double> _translateButtonX1;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250))
          ..addListener(() {
            setState(() {});
          });

    _buttonController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));

    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_buttonController);

    _animateColor = ColorTween(begin: Colors.blue, end: Colors.red)
        .animate(CurvedAnimation(parent: _animationController, curve: _curve));

    _translateButton = Tween<double>(begin: _fabHeight, end: -14.0)
        .animate(CurvedAnimation(parent: _animationController, curve: _curve));
    _translateButtonX1 = Tween<double>(begin: 0, end: 15)
        .animate(CurvedAnimation(parent: _animationController, curve: _curve));

    _translateButtonY2 = Tween<double>(begin: _fabHeight, end: 30.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.5, 1.0, curve: _curve)));

    _translateButtonX2 = Tween<double>(begin: 0, end: -52.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.5, 1.0, curve: _curve)));

    _translateButtonY3 = Tween<double>(begin: _fabHeight, end: 60.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.8, 1.0, curve: _curve)));

    _translateButtonX3 = Tween<double>(begin: 0, end: -70.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.8, 1.0, curve: _curve)));
  }

  animate() {
    isPressed = !isPressed;
    if (isPressed) {
      _buttonController.forward();
      _animationController.forward();
    } else {
      this.text = "Floating Menu";
      _buttonController.reverse();
      _animationController.reverse();
    }
  }

  Widget button() {
    return FloatingActionButton(
        backgroundColor: _animateColor.value,
        onPressed: animate,
        elevation: 10,
        tooltip: 'Toggle',
        child: new AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.black),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: _buttons(),
          ),
        ],
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }

  Widget _buttons() {
    return Container(
      height: 300,
      width: 300,
      margin: EdgeInsets.all(30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Transform(
            transformHitTests: true,
            transform: Matrix4.translationValues(
                _translateButtonX3.value, _translateButtonY3.value * 3.0, 0.0),
            child: Container(
              child: FloatingActionButton(
                onPressed: () {
                  onButtonTap("Search");
                },
                child: Icon(Icons.search),
                elevation: 2,
              ),
            ),
          ),
          Transform(
            transform: Matrix4.translationValues(
                _translateButtonX2.value, _translateButtonY2.value * 2.0, 0.0),
            child: FloatingActionButton(
              onPressed: () {
                onButtonTap("Map");
              },
              child: Icon(Icons.map),
              elevation: 2,
            ),
          ),
          Transform(
            transform: Matrix4.translationValues(
                _translateButtonX1.value, _translateButton.value * 1.0, 0.0),
            child: Container(
              child: FloatingActionButton(
                onPressed: () {
                  onButtonTap("Movie");
                },
                child: Icon(Icons.movie),
                elevation: 2,
              ),
            ),
          ),
          button()
        ],
      ),
    );
  }

  void onButtonTap(String text) {
    this.text = text;
    isPressed = !isPressed;
    _animationController.reverse();
    _buttonController.reverse();
    setState(() {});
  }
}
