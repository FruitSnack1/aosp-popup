import 'dart:async';

import 'package:bubble_overlay/bubble_overlay.dart';
import 'package:flutter/material.dart';

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
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Timer ?timer;
  final BubbleOverlay bubbleOverlay = BubbleOverlay();
  double value = 0;

  @override
  void initState() {
    super.initState();
  }

  showPopup() {
    timer?.cancel();
    if (!bubbleOverlay.isOpen)
      bubbleOverlay.openBubble(
          backgroundColor: "#AAAAAA", middleText: "$value");
    bubbleOverlay.updateMiddleText("$value");
    this.timer = Timer(Duration(seconds: 2), ()=>{
      if(bubbleOverlay.isOpen)
        bubbleOverlay.closeBubble()
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 30, 30, 30),
        child: Center(
          child: Slider(
              value: value,
              min: 0,
              max: 100,
              divisions: 5,
              onChanged: (val) {
                setState(() {
                  value = val;
                  showPopup();
                });
              }),
        ));
  }
}
