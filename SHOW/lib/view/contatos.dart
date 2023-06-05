import 'package:flutter/material.dart';

import 'add_cont.dart';
import 'lista.dart';

class Contatos extends StatefulWidget {

  @override
  State<Contatos> createState() => _ContatosState();
}

class _ContatosState extends State<Contatos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de Contatos',
          style: TextStyle(color: Colors.white, fontSize: 25),       
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
                "https://cdn-icons-png.flaticon.com/512/1810/1810705.png",
                height: 200),
            SizedBox(height: 30),
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
                              MaterialPageRoute(builder: (context) => ListaContatos()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), // Background color
                            ),
                          ),
                          child: Text('Listar Contatos',),
                          ), 
                        ),
                        SizedBox(width: 10),
                        SizedBox(
                          height: 100,
                          width: 170,
                          child: ElevatedButton(
                            onPressed: (){
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AdicionarContato()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: Text('Adicionar Contato'),
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
                          child: Text('Alterar Contato'),
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
                          child: Text('Excluir Contato'),
                        ), 
                      ),
                      SizedBox(height: 10),
                      ],
                    ),
                ]
         )
        )
      )
    );
  }
}