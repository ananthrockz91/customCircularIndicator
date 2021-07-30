import 'package:flutter/material.dart';
import 'package:flutter_app/custom_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  AnimationController _animationController;
  Animation _animation;
  double maxProgressValue = 100.0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 3000));
    _animation = Tween<double>(begin: 0, end: 100).animate(_animationController)..addListener(() {
      setState(() {});
    });

  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.grey,
        child: GestureDetector(
          onTap: () {
            if(_animation.value == maxProgressValue) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
          },
          child: Container(
            child: CustomPaint(
              foregroundPainter: CustomIndicator(value: _animation.value),
              child: Center(child: Text("${_animation.value.toInt()}", style: TextStyle(color: Colors.red, fontSize: 40, fontWeight: FontWeight.bold),)),
            ),
          ),
        ),
      ),
    );
  }
}

