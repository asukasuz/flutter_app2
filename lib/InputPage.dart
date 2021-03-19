import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'CalculateBmi.dart';
import 'OutputPage.dart';

// 性別を列挙型で定義
enum Gender { male, female }

Gender selectedGender;

// 身長、体重、年齢を定義
int height = 170;
int weight = 65;
int age = 25;

class InputPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InputPageState();
  }
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        backgroundColor: Colors.black54,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      // selectedGenderの値を見てtap後の色を変更する
                      color: selectedGender == Gender.male
                          ? Colors.black38
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "male",
                      style:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    alignment: AlignmentDirectional.bottomCenter,
                  ),
                  // Containerをボタンをして使うにはInkwellを使う
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 35, left: 15),
                      child: Icon(
                        Icons.child_care,
                        color: Colors.blue,
                        size: 130,
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      // selectedGenderの値を見てtap後の色を変更する
                      color: selectedGender == Gender.female
                          ? Colors.black38
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "female",
                      style:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    alignment: AlignmentDirectional.bottomCenter,
                  ),
                  // Containerをボタンをして使うにはInkwellを使う
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 35, left: 15),
                      child: Icon(
                        Icons.child_care,
                        color: Colors.pinkAccent,
                        size: 130,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    width: 340,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      " height",
                      style:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 90, left: 110),
                    child: Text(
                      height.toString(),
                      style:
                      TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 100, left: 185),
                    child: Text(
                      "cm",
                      style:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 135, left: 70),
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.black,
                        thumbColor: Color(0xFFFB1555),
                        overlayColor: Color(0x29FB1555),
                        thumbShape:
                        RoundSliderThumbShape(enabledThumbRadius: 13),
                        overlayShape:
                        RoundSliderOverlayShape(overlayRadius: 25),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 90,
                          max: 220,
                          onChanged: (double newVal) {
                            setState(() {
                              height = newVal.round();
                            });
                          }),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Align(
                      child: Text(
                        weight.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40, left: 5),
                    child: Text(
                      "weight",
                      style:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 140, left: 85),
                    child: ElevatedButton(
                      child: Text(
                        "+",
                        style: TextStyle(fontSize: 30),
                      ),
                      onPressed: () {
                        setState(() {
                          weight++;
                        });
                      },
                      style: ButtonStyle(
                          minimumSize:
                          MaterialStateProperty.all<Size>(Size(50, 50)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.pinkAccent),
                          shape: MaterialStateProperty.all<CircleBorder>(
                              CircleBorder(
                                  side: BorderSide(
                                      color: Colors.pinkAccent,
                                      style: BorderStyle.solid)))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 140, left: 25),
                    child: ElevatedButton(
                      child: Text(
                        "-",
                        style: TextStyle(fontSize: 30),
                      ),
                      onPressed: () {
                        setState(() {
                          weight--;
                        });
                      },
                      style: ButtonStyle(
                          minimumSize:
                          MaterialStateProperty.all<Size>(Size(50, 50)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.pinkAccent),
                          shape: MaterialStateProperty.all<CircleBorder>(
                              CircleBorder(
                                  side: BorderSide(
                                      color: Colors.pinkAccent,
                                      style: BorderStyle.solid)))),
                    ),
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Align(
                      child: Text(
                        age.toString(),
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40, left: 5),
                    child: Text(
                      "age",
                      style:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 140, left: 85),
                    child: ElevatedButton(
                      child: Text(
                        "+",
                        style: TextStyle(fontSize: 30),
                      ),
                      onPressed: () {
                        setState(() {
                          age++;
                        });
                      },
                      style: ButtonStyle(
                          minimumSize:
                          MaterialStateProperty.all<Size>(Size(50, 50)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.pinkAccent),
                          shape: MaterialStateProperty.all<CircleBorder>(
                              CircleBorder(
                                  side: BorderSide(
                                      color: Colors.pinkAccent,
                                      style: BorderStyle.solid)))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 140, left: 25),
                    child: ElevatedButton(
                      child: Text(
                        "-",
                        style: TextStyle(fontSize: 30),
                      ),
                      onPressed: () {
                        setState(() {
                          age--;
                        });
                      },
                      style: ButtonStyle(
                          minimumSize:
                          MaterialStateProperty.all<Size>(Size(50, 50)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.pinkAccent),
                          shape: MaterialStateProperty.all<CircleBorder>(
                              CircleBorder(
                                  side: BorderSide(
                                      color: Colors.pinkAccent,
                                      style: BorderStyle.solid)))),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  child: Text(
                    "LET'S CALCULATE",
                    style: TextStyle(fontSize: 25),
                  ),
                  onPressed: () {
                    CalculateBMI calc = CalculateBMI(height, weight);
                    Navigator.pushNamed(context, '/001/result',
                        arguments:
                        InputBMI(calc.calculateBmi(), calc.calculateMsg()));
                  },
                  style: ButtonStyle(
                      minimumSize:
                      MaterialStateProperty.all<Size>(Size(40, 60)),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black54)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}