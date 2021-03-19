import 'dart:math';
import 'package:flutter/material.dart';

class DiceApp extends StatefulWidget {
  @override
  // createStateはビルド後に呼ばれるメソッドで必須
  State<StatefulWidget> createState() {
    return _DiceState();
  }
}

class _DiceState extends State<DiceApp> {
  int leftDiceNum = 1;
  int rightDiceNum = 1;

  void changeDiceFace() {
    // Statefulの場合、setStateメソッドを書かないと状態変化しない
    setState(() {
      leftDiceNum = Random().nextInt(6) + 1;
      rightDiceNum = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("THE DICE IS CAST"), backgroundColor: Colors.teal),
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                  onPressed: () => changeDiceFace(),
                  child: Image.asset("images/dice$leftDiceNum.png")),
            ),
            Expanded(
              child: ElevatedButton(
                  onPressed: () => changeDiceFace(),
                  child: Image.asset("images/dice$rightDiceNum.png")),
            ),
          ],
        ),
      ),
    );
  }
}
