import 'package:flutter/material.dart';
import 'myBD.dart';

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});
          
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.monitor_weight)),
                Tab(icon: Icon(Icons.gas_meter_outlined)),
              ],
            ),
            title: Text('Usuários'),
          ),
          body: TabBarView(
            children: [MyProfile(), UserList()],
          ),
        ),
      ),
    );
  }
}

class MyProfile extends StatefulWidget {
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final _loginController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastro'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.all(100),
          child: Column(children: [
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/5526/5526473.png',
              width: 200,
            ),
            TextField(
              controller: _loginController,
              decoration: InputDecoration(
                labelText: 'Login',
              ),
            ),
            TextFormField(
              obscureText: true,
              controller: _senhaController,
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
            ),
            SizedBox(height: 20),
            Center(
                child: ElevatedButton(
              onPressed: () async {
                final login = _loginController.text;
                final senha = _senhaController.text;
                final db = await initDatabase();
                await db.insert('user', {'login': login, 'senha': senha});

                _loginController.clear();
                _senhaController.clear();
                },
              child: Text(
                'Cadastrar',
              ),
            ))
          ]),
        )));
  }
}

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<Map<String, dynamic>> _users = [];

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    final users = await getUsers();
    setState(() {
      _users = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];
          return ListTile(
            title: Text(user['login']),
            subtitle: Text(user['senha']),
          );
        },
      ),
    );
  }
}