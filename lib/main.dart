
import 'package:custompaint/custom_painter_example.dart';
import 'package:flutter/material.dart';
void main() => runApp(new MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      ),
      home: CustomPaintExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}