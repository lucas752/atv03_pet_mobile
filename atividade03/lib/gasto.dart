class Gasto {
  int? id; //checar se o identificador é único, o ? é um null checker
  String gastoCategoria;
  String gastoDescricao;
  double gastoValor;

  Gasto({this.id,required this.gastoCategoria,required this.gastoValor, required this.gastoDescricao});

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'gastoCategoria': gastoCategoria,
      'gastoDescricao': gastoDescricao,
      'gastoValor': gastoValor
    };
}
}