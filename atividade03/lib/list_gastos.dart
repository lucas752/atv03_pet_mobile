import 'package:atividade03/gasto.dart';
import 'package:atividade03/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListGastos extends StatefulWidget {
  const ListGastos({super.key});

  @override
  State<ListGastos> createState() => _ListGastosState();
}

class _ListGastosState extends State<ListGastos> {
  final TextEditingController txtGastoCategoria = TextEditingController();
  final TextEditingController txtGastoDescricao = TextEditingController();
  final TextEditingController txtGastoValor = TextEditingController();
  DatabaseHandler handle = new DatabaseHandler();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista dos Gastos'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<Gasto>>(
            future: this.handle.listGastos(),
            builder: (context, AsyncSnapshot<List<Gasto>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                              child: Material(
                                type: MaterialType.transparency,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black54,
                                        offset: Offset(0,05),
                                        blurRadius: 15
                                      )
                                    ]
                                  ),
                                  padding: const EdgeInsets.all(15),
                                  width: 300,
                                  height: 300,
                                  child: Column(
                                    children: [
                                      Text(
                                        '${snapshot.data![index].gastoCategoria}',
                                        style: const TextStyle(
                                          fontSize: 27,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "R\$ ${snapshot.data![index].gastoValor}",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "${snapshot.data![index].gastoDescricao}",
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black54,
                                          //fontWeight: FontWeight.w400,
                                        ),
                                        ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Ok')
                                      )
                                    ],
                                  ),
                                ),
                              )
                            );
                          }
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ListTile(
                          title: Text(snapshot.data![index].gastoCategoria),
                          subtitle: Text("R\$${snapshot.data![index].gastoValor.toStringAsFixed(2)}"),
                          leading: const Icon(Icons.monetization_on),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(
                              width: 3,
                              color: Colors.deepPurple,
                          )),
                          trailing: Container(
                            width: 80,
                            child: Row(
                              children: [
                                Expanded(
                                    child: IconButton(
                                        onPressed: () {
                                          txtGastoCategoria.text = snapshot.data![index].gastoCategoria;
                                          txtGastoDescricao.text = snapshot.data![index].gastoDescricao;
                                          txtGastoValor.text = '${snapshot.data![index].gastoValor}';
                                          showDialog(
                                            context: context, 
                                            builder: (context) {
                                              return Center(
                                                child: Material(
                                                  type: MaterialType.transparency,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                        color: Colors.white,
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            color: Colors.black,
                                                            offset: Offset(0,05),
                                                            blurRadius: 15
                                                          ),
                                                        ]
                                                    ),
                                                    padding: const EdgeInsets.all(25),
                                                    width: 300,
                                                    height: 400,
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          'Atualize as informações',
                                                          style: const TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.w400
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        TextField(
                                                          controller: txtGastoCategoria,
                                                          decoration: InputDecoration(
                                                            border: OutlineInputBorder(
                                                              borderRadius: BorderRadius.circular(5.0),
                                                              borderSide: const BorderSide(
                                                                color: Colors.black12, style: BorderStyle.solid
                                                              )
                                                            ),
                                                            hintText: 'Categoria'
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 15,
                                                        ),
                                                        TextField(
                                                          controller: txtGastoDescricao,
                                                          decoration: InputDecoration(
                                                            border: OutlineInputBorder(
                                                              borderRadius: BorderRadius.circular(5.0),
                                                              borderSide: const BorderSide(
                                                                color: Colors.black12, style: BorderStyle.solid
                                                              )
                                                            ),
                                                            hintText: 'Descrição'
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 15,
                                                        ),
                                                        TextField(
                                                          controller: txtGastoValor,
                                                          decoration: InputDecoration(
                                                            border: OutlineInputBorder(
                                                              borderRadius: BorderRadius.circular(5.0),
                                                              borderSide: const BorderSide(
                                                                color: Colors.black12, style: BorderStyle.solid
                                                              )
                                                            ),
                                                            hintText: 'Valor'
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 30,
                                                        ),
                                                        ElevatedButton(
                                                          onPressed: () async {
                                                            Gasto gasto = Gasto(
                                                              id: snapshot.data![index].id,
                                                              gastoCategoria: txtGastoCategoria.text, 
                                                              gastoDescricao: txtGastoDescricao.text,
                                                              gastoValor: double.parse(txtGastoValor.text)
                                                            );
                                                            await handle.updateGasto(snapshot.data![index].id as int, gasto);
                                                            setState(() {});
                                                            Navigator.of(context).pop();
                                                          }, 
                                                          child: const Text('Atualizar')
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                            );
                                            }
                                          );
                                        },
                                        icon: Icon(
                                            Icons.edit))),
                                Expanded(
                                    child: IconButton(
                                        onPressed: () async {
                                          await handle.removeGasto(snapshot.data![index].id as int);
                                          setState(() {
                                            snapshot.data?.removeAt(index);
                                          });
                                        },
                                        icon: Icon(
                                            Icons.delete)))
                              ],
                            ),
                          ),
                        )),
                    );
                  },
                );
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [Text('Sem gastos no momento!')],
              );
            }),
      ),
    );
  }

}
