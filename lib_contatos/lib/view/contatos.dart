import 'package:flutter/material.dart';
import 'my_bd.dart';

class TabBarDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
            'Contatos',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Colors.amber,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.contacts)),
                Tab(icon: Icon(Icons.person)),
              ],
            ),
          ),
          body: TabBarView(
            children: [AddContato(), ContatosLista()],
          ),
        ),
      ),
    );
  }
}

class AddContato extends StatefulWidget {
  @override
  State<AddContato> createState() => _AddContatoState();
}

class _AddContatoState extends State<AddContato> {
  final _numeroController = TextEditingController();
  final _nomeController = TextEditingController();
  final _cepController = TextEditingController();

  List<Map<String, dynamic>> _contatos = [];

  @override
  void initState() {
    super.initState();
    _loadContatos();
  }

  Future<void> _loadContatos() async {
    final contatos = await getContatos();
    setState(() {
      _contatos = contatos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.all(100),
          child: Column(children: [
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/1810/1810705.png',
              width: 200,
            ),
            SizedBox(height: 30),
            TextField(
              controller: _numeroController,
              keyboardType: TextInputType.phone,
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
              controller: _cepController,
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecoration(
                labelText: 'CEP',
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
                final cep = _cepController.text;
                final db = await initDatabase();
                await db.insert('contato', {'numero': numero, 'nome': nome, 'cep': cep});

                _numeroController.clear();
                _nomeController.clear();
                 _cepController.clear();
                },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
                minimumSize:
                MaterialStateProperty.all<Size>(Size(150, 50)),
                maximumSize:
                MaterialStateProperty.all<Size>(Size(180, 50)),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 4),
                    Text('Adicionar Contato'),
                    ],
                  ),
            ),])
          ),
        ));
  }
}

class ContatosLista extends StatefulWidget {
  @override
  _ContatosListaState createState() => _ContatosListaState();
}

class _ContatosListaState extends State<ContatosLista> {
  List<Map<String, dynamic>> _contatos = [];

  @override
  void initState() {
    super.initState();
    _loadContatos();
  }

  Future<void> _loadContatos() async {
    final contatos = await getContatos();
    setState(() {
      _contatos = contatos;
    });
  }

  Future<void> _editarContato(Map<String, dynamic> contato) async {
    final db = await initDatabase();
    await db.update('contato', contato);
    await _loadContatos();
  }

  Future<void> _excluirContato(Map<String, dynamic> contato) async {
    final db = await initDatabase();
    await db.delete('contato', where: 'numero = ?', whereArgs: [contato['numero']]);
    await _loadContatos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _contatos.length,
        itemBuilder: (context, index) {
          final user = _contatos[index];
          return ListTile(
            title: Text(user['numero']),
            subtitle: Text(user['nome']),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _editarContato(_contatos as Map<String, dynamic>),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _excluirContato(_contatos as Map<String, dynamic>),
                ),
          ]));
        },
      ),
    );
  }
}