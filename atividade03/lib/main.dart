import 'package:atividade03/charts.dart';
import 'package:atividade03/database.dart';
import 'package:atividade03/list_gastos.dart';
import 'package:atividade03/gasto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    home: HomePage(title: 'Meus Gastos'),
    theme: ThemeData(
      primarySwatch: Colors.deepPurple,
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      })
    ),
   );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController txtGastoCategoria = TextEditingController();
  TextEditingController txtGastoDescricao = TextEditingController();
  TextEditingController txtGastoValor = TextEditingController();
  DatabaseHandler handler= new DatabaseHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus gastos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                      color: Colors.deepPurple, style: BorderStyle.solid
                    )
                  ),
                  hintText: 'Categoria'
                ),
                controller: txtGastoCategoria,
                style: const TextStyle(fontSize: 20.0),
              ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Colors.deepPurple, style: BorderStyle.solid
                      )
                    ),
                    hintText: 'Descrição'
                  ),
                  controller: txtGastoDescricao,
                  style: const TextStyle(fontSize: 20.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Colors.deepPurple, style: BorderStyle.solid
                      )
                    ),
                    hintText: 'Valor'
                  ),
                  controller: txtGastoValor,
                  style: const TextStyle(fontSize: 20.0),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ListGastos()
                    )
                  );
                },
                child: const Text("Lista de gastos"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BarChart()
                    )
                  );
                },
                child: const Text("Gráfico dos gastos"),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Gasto gasto = Gasto(
            gastoCategoria: txtGastoCategoria.text, 
            gastoDescricao: txtGastoDescricao.text,
            gastoValor: double.parse(txtGastoValor.text)
          );
          handler.insertGasto(gasto);
          txtGastoCategoria.text = '';
          txtGastoDescricao.text = '';
          txtGastoValor.text = '';
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}