import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 150.0;
  bool? _blockCheck = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(children: <Widget>[
          _createSlider(),
          _createCheckBox(),
          _createSwitch(),
          Expanded(child: _createImage())
        ])
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.blueAccent,
      label: 'Image size',
      //divisions: 20,
      value: _sliderValue,
      min: 10.0,
      max: 400.0,
      onChanged: (_blockCheck!) ? null :
      (value) {
        setState(() {
          _sliderValue = value;
        });
        //print(_sliderValue);
      },
    );
  }

  Widget _createImage() {
    return Image(
      image:
        NetworkImage('http://pngimg.com/uploads/simpsons/simpsons_PNG3.png'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }

  Widget _createCheckBox() {
    /* return Checkbox(
      value: _blockCheck,
      onChanged: (value) {
        setState(() {
          _blockCheck = value;
        });
    }); */
    return CheckboxListTile(
      title: (_blockCheck!) ? Text('Unlock slider') : Text('Block slider'),
      value: _blockCheck, 
      onChanged: (value) {
        setState(() {
          _blockCheck = value;
        });
      }
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: (_blockCheck!) ? Text('Unlock slider') : Text('Block slider'),
      value: _blockCheck!, 
      onChanged: (value) {
        setState(() {
          _blockCheck = value;
        });
      }
    );
  }
}
