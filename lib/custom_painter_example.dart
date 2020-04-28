import 'dart:ui';
import 'package:custompaint/green_clipper.dart';
import 'package:custompaint/my_painter.dart';
import 'package:custompaint/widgets/custom_painter_example_widgets.dart';
import 'package:flutter/material.dart';

class CustomPaintExample extends StatefulWidget {
  @override
  _CustomPaintExampleState createState() => _CustomPaintExampleState();
}

class _CustomPaintExampleState extends State<CustomPaintExample> with SingleTickerProviderStateMixin{
  double percentValue = 0.0;
  double newPercentage = 0.0;
  AnimationController _percentValueAnimationController;
  double _height;
  double _width;

  @override
  void initState() {
    super.initState();
    setState(() {
      percentValue = 0.0;
    });
    _percentValueAnimationController = new AnimationController(
        vsync: this,
        duration: new Duration(milliseconds: 1000)
    )
      ..addListener((){
        setState(() {
          percentValue =lerpDouble(percentValue,newPercentage,_percentValueAnimationController.value);
        });
      });
  }
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.greenAccent[200],
        title: Text('Custom Painter Example'),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            CustomPainterExampleWidgets.buildShape(),
            CustomPainterExampleWidgets.buildButtonAnimation(
              height: _height/2,
              width: _width/2,
              percentValue: percentValue,
              onPress: (){
                setState(() {
                  percentValue = newPercentage;
                  newPercentage += 10;
                  if(newPercentage>100.0){
                    percentValue=0.0;
                    newPercentage=0.0;
                  }
                  _percentValueAnimationController.forward(from: 0.0);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}


