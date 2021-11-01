import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({Key? key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  //Variables elements
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.red;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(5.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
          child: AnimatedContainer(
        curve: Curves.linear,
        duration: Duration(seconds: 1),
        width: _width,
        height: _height,
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          color: _color,
        ),
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: _changeForm,
      ),
    );
  }

  void _changeForm() {
    final random = Random();

    setState(() {
      _width = random.nextInt(250).toDouble();
      _height = random.nextInt(250).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
      _borderRadius = BorderRadius.circular(random.nextInt(150).toDouble());
    });
  }
}
