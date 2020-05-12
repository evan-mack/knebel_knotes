
import './home_page.dart';
import 'package:flutter/material.dart';
import './InfoPage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        InfoPage.routeName: (BuildContext context) => InfoPage()
      },
    );
  }
}

