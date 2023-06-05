import 'package:flutter/material.dart';
import 'my_bd.dart';

class ListaContatos extends StatefulWidget {
  
  @override
  _ListaContatosState createState() => _ListaContatosState();
}

class _ListaContatosState extends State<ListaContatos> {
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
      body: ListView.builder(
        itemCount: _contatos.length,
        itemBuilder: (context, index) {
          final contato = _contatos[index];
          return ListTile(
            title: Text(contato['numero']),
            subtitle: Text(contato['nome']), 
          );
        },
      ),
    );
  }
}