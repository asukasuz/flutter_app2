
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Launch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Gochamaze App"), backgroundColor: Colors.teal),
      backgroundColor: Colors.amberAccent,
      body: Center(
        child: Text(
          "左上のサイドバーから\n好きなアプリを選んでね",
          style: TextStyle(
            fontSize: 30
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("001:アプリ", style: TextStyle(fontSize: 30)),
              onTap: () {
                Navigator.pushNamed(context, '/001');
              },
            ),
            ListTile(
              title: Text("002:アプリ", style: TextStyle(fontSize: 30)),
              onTap: () => {
              Navigator.pushNamed(context, '/002')
              },
            ),
          ],
        ),
      ),
    );
  }
}