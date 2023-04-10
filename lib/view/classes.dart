import 'package:flutter/material.dart';

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.monitor_weight)),
                Tab(icon: Icon(Icons.gas_meter_outlined)),
                Tab(icon: Icon(Icons.person)),
              ],
            ),
            title: Text('Atividades'),
          ),
          body: TabBarView(
            children: [IMC(), GasStation(), MyProfile()],
          ),
        ),
      ),
    );
  }
}

class IMC extends StatefulWidget {
  @override
  _IMCState createState() => _IMCState();
}

class _IMCState extends State<IMC> {
  TextEditingController _peso = TextEditingController();
  TextEditingController _altura = TextEditingController();
  double imc = 0;
  String mensagem = '';
  double alturaEmMetros = 0;

  void _imc() {
    double peso = double.tryParse(_peso.text) ?? 0;
    double altura = double.tryParse(_altura.text) ?? 0;
    alturaEmMetros = altura / 100;
    if (altura > 0) {
      imc = (peso / (alturaEmMetros * alturaEmMetros));
    } else {
      imc = 0;
    }

    if (imc < 18.6) {
      mensagem = 'Abaixo do peso';
    } else if (imc < 25) {
      mensagem = 'Peso ideal';
    } else if (imc < 30) {
      mensagem = 'Levemente acima do Peso';
    } else if (imc < 35) {
      mensagem = 'Obesidade grau I';
    } else if (imc < 40) {
      mensagem = 'Obesidade grau II';
    } else {
      mensagem = 'Obesidade grau III';
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('IMC'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _peso.text = '';
                _altura.text = '';
                imc = 0;
                mensagem = '';
                setState(() {});
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.network(
                  'https://cdn-icons-png.flaticon.com/512/2117/2117109.png',
                  width: 50),
              SizedBox(height: 5),
              TextField(
                controller: _peso,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Peso (kg)',
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 25.0)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 25.0),
              ),
              TextField(
                controller: _altura,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Altura (cm)',
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 25.0)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 25.0),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: _imc,
                    child: Text(
                      'Calcular',
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ),
                ),
              ),
              Text(
                'IMC: ${imc.toStringAsFixed(1)}',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 25.0),
              ),
              Text(
                mensagem,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 25.0),
              )
            ],
          ),
        ));
  }
}

class GasStation extends StatefulWidget {
  @override
  State<GasStation> createState() => _GasStationState();
}

class _GasStationState extends State<GasStation> {
  TextEditingController _gasolina = TextEditingController();
  TextEditingController _alcool = TextEditingController();
  bool abastecerAlcool = false;
  double calculo = 0;

  void _posto() {
    int valorGasolina = int.tryParse(_gasolina.text) ?? 0;
    int valorAlcool = int.tryParse(_alcool.text) ?? 0;
    calculo = valorAlcool / valorGasolina * 100;
    abastecerAlcool = calculo >= 70;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.all(100),
              child: Column(
                children: [
                  Image.network(
                    "https://cdn-icons-png.flaticon.com/512/224/224480.png",
                    width: 250,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _gasolina,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Preço da Gasolina',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    controller: _alcool,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Preço do Álcool',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: _posto,
                    child: Text('Calcular'),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Resultado: $calculo',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    abastecerAlcool
                        ? 'Melhor abastecer com Álcool'
                        : 'Melhor abastecer com Gasolina',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ))),
    );
  }
}

class MyProfile extends StatefulWidget {
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  controller: _nomeController,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondPage(
                            nome: _nomeController.text,
                            email: _emailController.text,
                          ),
                        ),
                      );
                    },
                    child: Text('Enviar'),
                  ),
                )
              ]),
        ));
  }
}

class SecondPage extends StatefulWidget {
  final String nome;
  final String email;

  const SecondPage({required this.nome, required this.email});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
              'https://assets.podomatic.net/ts/24/8a/c0/podcast29591/640x640_8321714.jpg?1645599250',
              height: 200),
          SizedBox(height: 16),
          Text(
            'Nome: ${widget.nome}',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 8),
          Text(
            'Email: ${widget.email}',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, '/a');
        },
        child: Icon(Icons.arrow_back_ios_new),
      ),
    );
  }
}
