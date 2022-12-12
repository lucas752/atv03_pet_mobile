import 'package:atividade03/database.dart';
import 'package:flutter/material.dart';
import 'package:atividade03/gasto.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BarChart extends StatelessWidget {
  
  const BarChart({super.key});

  static List<charts.Series<Gasto, String>> _createSampleData() {

    final data = [
      Gasto(gastoCategoria: "Despesas", gastoValor: 300.5, gastoDescricao: "almoço"),
      Gasto(gastoCategoria: "Lazer", gastoValor: 450.5, gastoDescricao: "almoço"),
      Gasto(gastoCategoria: "Estudos", gastoValor: 159.5, gastoDescricao: "almoço"),
      Gasto(gastoCategoria: "Carro", gastoValor: 856.9, gastoDescricao: "almoço"),
    ];

    return[
      charts.Series<Gasto,String>(data: data, id: 'gastos', colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.deepPurple),
      domainFn: (Gasto gasto, _) => gasto.gastoCategoria,
      measureFn: (Gasto gasto,_) => gasto.gastoValor,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gráfico dos gastos"),
      ),
      body: Center(
        child: Container(
          height: 600,
          child: charts.BarChart(
            _createSampleData(),
            animate: false,
        ),
      )
    )
    );
  }
}