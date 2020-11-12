import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: PrimeiraRota(),
    ));

/*// O objeto da classe mensagem será enviado para a segunda rota.
class Mensagem {
  String titulo;
  String texto;
  Mensagem(this.titulo, this.texto);
}*/
// O objeto da classe mensagem será enviado para a segunda rota.
class Preco {
  double etanol;
  double gasolina;
  Preco(this.etanol, this.gasolina);
  razao() => etanol / gasolina;
}

class PrimeiraRota extends StatelessWidget {
  //const PrimeiraRota({Key key}) : super(key: key);
  final TextEditingController etanolController = TextEditingController();
  final TextEditingController gasolinaController = TextEditingController();
  Preco preco;
  // Mensagem mensagem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primeira Rota'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(35),
            child: TextField(
              controller: etanolController,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () => etanolController.clear(),
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Informe o Valor do Etanol'),
            ),
          ),
          Container(
            margin: EdgeInsets.all(35),
            child: TextField(
              controller: gasolinaController,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () => gasolinaController.clear(),
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Informe o Valor da Gasolina'),
            ),
          ),
          /*ElevatedButton(
            onPressed: () {
              mensagem = Mensagem(etanolController.text, gasolinaController.text);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SegundaRota(mensagem)));
            },
            child: Text('Ir Para a Segunda Rota'),
          )*/
          ElevatedButton(
            onPressed: () {
              preco = Preco(double.tryParse(etanolController.text),
                  double.tryParse(gasolinaController.text));
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SegundaRota(preco)));
            },
            child: Text('Ir Para a Segunda Rota'),
          )
        ],
      ),
    );
  }
}

class SegundaRota extends StatelessWidget {
  //const SegundaRota({Key key}) : super(key: key);
  //final Mensagem mensagem;
  //SegundaRota(this.mensagem);
  final Preco preco;
  SegundaRota(this.preco);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Rota'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              '${preco.etanol.toStringAsFixed(2)} / ${preco.gasolina.toStringAsFixed(2)} = ${preco.razao().toStringAsFixed(2)}',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.amber,
                  fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                if (preco.razao() > 0.7) ...[
                  Text(
                    'Abasteça com Gasolina!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amber),
                  )
                ] else ...[
                  Text(
                    'Abasteça com Etanol!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amber),
                  )
                ]
              ],
            ),
            /*Text(
              '${mensagem.texto}',
              style: TextStyle(fontSize: 25, color: Colors.blue),
            ),*/
            ElevatedButton(
              child: Text('Ir Para A Primeira Rota'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
