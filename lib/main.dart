import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snake',
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  MyHomePage({Key? key}) : super(key: key);

  @override
  SnakeWidget createState() => SnakeWidget();
}

class SnakeWidget extends State<MyHomePage>{
  late IFrameElement iFrameElement;
  @override
  void initState() {
    super.initState();
    iFrameElement = IFrameElement()
     ..src = "web/snake/htmlSnake.html"
     ..id = "iframe"
     ..style.border = "none";
    //ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => iFrameElement,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width * 0.75,
            child: HtmlElementView(
              viewType: 'iframeElement',
            ),
          ),
      ],
    );
  }
}

