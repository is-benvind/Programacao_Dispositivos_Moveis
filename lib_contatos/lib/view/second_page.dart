import 'package:flutter/material.dart';
import 'contatos.dart';

class SecondPage extends StatefulWidget {
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'App de Contatos',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: Center(
            child: Container(
              margin: EdgeInsets.only(left: 10, top: 50, right: 10),
              child: Column(children: <Widget>[
                Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Instituto_Federal_do_Piau%C3%AD_-_Marca_Vertical_2015.svg/1200px-Instituto_Federal_do_Piau%C3%AD_-_Marca_Vertical_2015.svg.png",
                  height: 200),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 170,
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TabBarDemo()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), // Background color
                            ),
                          ),
                          child: Text('Contatos',),
                          ), 
                        ),
                        SizedBox(width: 10),
                        SizedBox(
                          height: 100,
                          width: 170,
                          child: ElevatedButton(
                            onPressed: null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: Text('Mapa'),
                          ), 
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                        height: 100,
                        width: 170,
                        child: ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: Text('Extra'),
                        ), 
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 100,
                        width: 170,
                        child: ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: Text('Extra'),
                        ), 
                      ),
                      SizedBox(height: 10),
                      ],
                    ),
                  ]
                ),
              )
            )
          );
        }
      }
