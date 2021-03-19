
import 'package:flutter/material.dart';
import 'package:flutter_app2/dice.dart';
import 'package:flutter_app2/launchScreen.dart';

import 'InputPage.dart';
import 'OutputPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/' : (context) => Launch(),
          '/001' : (context) => InputPage(),
          '/001/result' : (context) => OutputPage(),
          '/002' : (context) => DiceApp(),
        },
        title: 'Flutter Gochamaze App',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.teal
        ),
    );
  }
}
