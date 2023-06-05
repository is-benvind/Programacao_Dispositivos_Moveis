import 'package:flutter/material.dart';

import '../view/my_home_page.dart';
import '../view/second_page.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/a': (BuildContext context) => SecondPage(),
      },
    );
  }
}