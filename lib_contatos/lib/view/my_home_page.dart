import 'package:flutter/material.dart';
import 'package:flutter_application_final/view/second_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Instituto_Federal_do_Piau%C3%AD_-_Marca_Vertical_2015.svg/1200px-Instituto_Federal_do_Piau%C3%AD_-_Marca_Vertical_2015.svg.png",
                height: 250),
            SizedBox(height: 30),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              obscureText: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                border: OutlineInputBorder(),

              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()));
              },
              child: Text('Entrar'),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(500, 58)),
              ),
            ),
          ],
        ),
      )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
