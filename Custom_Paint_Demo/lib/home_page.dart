import 'dart:ui';
import 'package:custompaint/green_clipper.dart';
import 'package:custompaint/my_painter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  double percentage = 0.0;
  double newPercentage = 0.0;
  AnimationController percentageAnimationController;
  @override
  void initState() {
    super.initState();
    setState(() {
      percentage = 0.0;
    });
    percentageAnimationController = new AnimationController(
        vsync: this,
        duration: new Duration(milliseconds: 1000)
    )
      ..addListener((){
        setState(() {
          percentage =lerpDouble(percentage,newPercentage,percentageAnimationController.value);
        });
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Flutter Custom Paint'),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: GreenClipper(),
              child: Container(
                color: Colors.greenAccent.withOpacity(0.7),
              ),
            ),
            Center(
              child: Container(
                height: 200.0,
                width: 200.0,
                child:  CustomPaint(
                  foregroundPainter:  MyPainter(
                      lineColor: Colors.grey[300],
                      completeColor: Colors.red,
                      completePercent: percentage,
                      width: 8.0
                  ),
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new RaisedButton(
                        color: Colors.cyanAccent,
                        splashColor: Colors.tealAccent,
                        shape:  CircleBorder(),
                        child: Text("Press\n  ${percentage.toInt()}%",
                          style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                        onPressed: (){
                          setState(() {
                            percentage = newPercentage;
                            newPercentage += 10;
                            if(newPercentage>100.0){
                              percentage=0.0;
                              newPercentage=0.0;
                            }
                            percentageAnimationController.forward(from: 0.0);
                          });
                        }),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

