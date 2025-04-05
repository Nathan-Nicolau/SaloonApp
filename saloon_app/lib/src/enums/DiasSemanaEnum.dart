import 'package:saloon_app/src/model/vo/DiaSemanaVO.dart';

enum DiasSemanaEnum {

  SEGUNDA_FEIRA(1,"Segunda-feira"),
  TERCA_FEIRA(2,"Terça-feira"),
  QUARTA_FEIRA(3,"Quarta-feira"),
  QUINTA_FEIRA(4,"Quinta-feira"),
  SEXTA_FEIRA(5,"Sexta-feira"),
  SABADO(6,"Sábado"),
  DOMINGO(7,"Domigo");

  final int codigo;
  final String descricao;

  const DiasSemanaEnum(this.codigo, this.descricao);

  static List<DiaSemanaVO> getListaSemana() {
    List<DiaSemanaVO> listaReturn = [];
    for(var dia in DiasSemanaEnum.values) {
      listaReturn.add(DiaSemanaVO(diaSemana: dia.codigo, nomeDiaSemana: dia.descricao));
    }
    return listaReturn;
  }

}