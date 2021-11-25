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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // onClick() async {
  //   await SystemAlertWindow.requestPermissions;

  //   SystemWindowHeader header = SystemWindowHeader(
  //       title: SystemWindowText(
  //           text: "Incoming Call", fontSize: 10, textColor: Colors.black45),
  //       padding: SystemWindowPadding.setSymmetricPadding(12, 12),
  //       subTitle: SystemWindowText(
  //           text: "9898989899",
  //           fontSize: 14,
  //           fontWeight: FontWeight.BOLD,
  //           textColor: Colors.black87),
  //       decoration: SystemWindowDecoration(startColor: Colors.grey[100]),
  //       button: SystemWindowButton(
  //           text: SystemWindowText(
  //               text: "Personal", fontSize: 10, textColor: Colors.black45),
  //           tag: "personal_btn"),
  //       buttonPosition: ButtonPosition.TRAILING);

  //   SystemWindowFooter footer = SystemWindowFooter(
  //       buttons: [
  //         SystemWindowButton(
  //           text: SystemWindowText(
  //               text: "Simple button",
  //               fontSize: 12,
  //               textColor: Color.fromRGBO(250, 139, 97, 1)),
  //           tag: "simple_button", //useful to identify button click event
  //           padding:
  //               SystemWindowPadding(left: 10, right: 10, bottom: 10, top: 10),
  //           width: 0,
  //           height: SystemWindowButton.WRAP_CONTENT,
  //           decoration: SystemWindowDecoration(
  //               startColor: Colors.white,
  //               endColor: Colors.white,
  //               borderWidth: 0,
  //               borderRadius: 0.0),
  //         ),
  //         SystemWindowButton(
  //           text: SystemWindowText(
  //               text: "Focus button", fontSize: 12, textColor: Colors.white),
  //           tag: "focus_button",
  //           width: 0,
  //           padding:
  //               SystemWindowPadding(left: 10, right: 10, bottom: 10, top: 10),
  //           height: SystemWindowButton.WRAP_CONTENT,
  //           decoration: SystemWindowDecoration(
  //               startColor: Color.fromRGBO(250, 139, 97, 1),
  //               endColor: Color.fromRGBO(247, 28, 88, 1),
  //               borderWidth: 0,
  //               borderRadius: 30.0),
  //         )
  //       ],
  //       padding: SystemWindowPadding(left: 16, right: 16, bottom: 12),
  //       decoration: SystemWindowDecoration(startColor: Colors.white),
  //       buttonsPosition: ButtonPosition.CENTER);

  //   SystemWindowBody body = SystemWindowBody(
  //     rows: [
  //       EachRow(
  //         columns: [
  //           EachColumn(
  //             text: SystemWindowText(
  //                 text: "Some body", fontSize: 12, textColor: Colors.black45),
  //           ),
  //         ],
  //         gravity: ContentGravity.CENTER,
  //       ),
  //     ],
  //     padding: SystemWindowPadding(left: 16, right: 16, bottom: 12, top: 12),
  //   );

  //   await SystemAlertWindow.showSystemWindow(
  //       height: 230,
  //       header: header,
  //       body: body,
  //       footer: footer,
  //       margin: SystemWindowMargin(left: 8, right: 8, top: 100, bottom: 0),
  //       gravity: SystemWindowGravity.TOP,
  //       notificationTitle: "Incoming Call",
  //       notificationBody: "+1 646 980 4741",
  //       prefMode: SystemWindowPrefMode.OVERLAY);
  //   //Using SystemWindowPrefMode.DEFAULT uses Overlay window till Android 10 and bubble in Android 11
  //   //Using SystemWindowPrefMode.OVERLAY forces overlay window instead of bubble in Android 11.
  //   //Using SystemWindowPrefMode.BUBBLE forces Bubble instead of overlay window in Android 10 & above
  //   Timer timer = Timer(Duration(seconds: 3), () {
  //     print("Ama close the window");
  //     SystemAlertWindow.closeSystemWindow();
  //   });
  // }

  Timer? timer;
  final BubbleOverlay bubbleOverlay = BubbleOverlay();
  bool closed = true;

  @override
  void initState() {
    super.initState();
  }

  startTimer() {
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (closed)
        bubbleOverlay.openBubble(backgroundColor: "#AAAAAA");
      else
        bubbleOverlay.closeBubble();
      this.closed = !this.closed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 30, 30, 30),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        TextButton(
            child: Text('Click me...'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 70, 70, 70)),
              foregroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 170, 170, 170)),
            ),
            onPressed: () {}),
        TextButton(
            child: Text('Close $closed'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 70, 70, 70)),
              foregroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 170, 170, 170)),
            ),
            onPressed: () {
              startTimer();
            }),
      ]),
    );
  }
}
