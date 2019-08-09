import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Slider(
            value: this._sliderValue,
            activeColor: Theme.of(context).accentColor,
            inactiveColor: Theme.of(context).accentColor.withOpacity(0.5),
            max: 100,
            min: 0,
            divisions: 5,
            label: '${this._sliderValue.toInt()}',
            onChanged: (value){
              setState(() {
               this._sliderValue = value; 
              });
            },
          ),
        ),
    );
  }
}