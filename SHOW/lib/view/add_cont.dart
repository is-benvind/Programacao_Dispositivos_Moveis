import 'package:flutter/material.dart';
import 'my_bd.dart';

class AdicionarContato extends StatefulWidget {

  @override
  State<AdicionarContato> createState() => _AdicionarContatoState();
}

class _AdicionarContatoState extends State<AdicionarContato> {
  final _numeroController = TextEditingController();
  final _nomeController = TextEditingController();
  final _localizacaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _numeroController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Número',
                labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: _nomeController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Nome',
                labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: _localizacaoController,
              keyboardType: TextInputType.streetAddress ,
              decoration: InputDecoration(
                labelText: 'Localização',
                labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                border: OutlineInputBorder(),

              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () async {
                final numero = _numeroController.text;
                final nome = _nomeController.text;
                final localizacao = _localizacaoController.text;
                final db = await initDatabase();
                await db.insert('contato', {'numero': numero, 'nome': nome, 'localizacao': localizacao});

                _numeroController.clear();
                _nomeController.clear();
                _localizacaoController.clear();

              },
              child: Text(
                'Adicionar',
             ),
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
