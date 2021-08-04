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
  void reset(){
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: Duration.zero,
        pageBuilder: (_, __, ___) => MyHomePage(),
      ),
    );
  }
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
    return Container(
      color: Colors.yellow[300],
      child: Column(
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
            const SizedBox(height: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0x9E0D47A1),
                            Color(0x9C1976D2),
                            Color(0x9F42A5F5),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: reset,
                    child: const Text('Restart game'),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
}

