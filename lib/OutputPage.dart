import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputBMI {
  final String bmi;
  final String calcMessage;

  InputBMI(this.bmi, this.calcMessage);
}

class OutputPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OutputPageState();
  }
}

class _OutputPageState extends State<OutputPage> {
  @override
  Widget build(BuildContext context) {
    //引数を読み出すときに使う。
    final InputBMI input = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        backgroundColor: Colors.black54,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 60),
            child: Text(
              "Your BMI is...",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            alignment: AlignmentDirectional.bottomCenter,
          ),
          Container(
            margin: EdgeInsets.only(top: 70),
            color: Colors.white,
            width: 140,
            height: 120,
            child: Text(
              input.bmi,
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            alignment: AlignmentDirectional.center,
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: 140,
            height: 80,
            child: Text(
              input.calcMessage,
              style: TextStyle(fontSize: 25),
            ),
            alignment: AlignmentDirectional.center,
          ),
          Container(
            margin: EdgeInsets.only(top: 150),
            child: ElevatedButton(
                child: Text(
                  "RECALCULATE",
                  style: TextStyle(fontSize: 25),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(Size(40, 70)),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.black54))),
          ),
        ],
      ),
    );
  }
}
