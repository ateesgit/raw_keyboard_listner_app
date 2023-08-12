import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void onEventKey(RawKeyEvent event) async {
    if (event.runtimeType.toString() == 'RawKeyDownEvent') {
      if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
        _controller.animateTo(_controller.offset + 100,
            curve: Curves.linear, duration: Duration(milliseconds: 50));
      }
      if (event.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
        _controller.animateTo(_controller.offset - 100,
            curve: Curves.linear, duration: Duration(milliseconds: 50));
      }
    }
  }

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: onEventKey,
        autofocus: true,
        child: Container(
          child: Scrollbar(
            controller: _controller,
            isAlwaysShown: true,
            child: ListView.builder(
              controller: _controller,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  color:
                      Colors.accents[Random().nextInt(Colors.accents.length)],
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(fontSize: 200),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}