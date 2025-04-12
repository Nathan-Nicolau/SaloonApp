import 'dart:ui';

import 'package:saloon_app/src/utils/AppColors.dart';

enum PlanoUsoSaloonEnum {

  BRONZE(1,"Bronze",AppColors.bronze,2,39.99,false),
  PRATA(2,"Prata",AppColors.prata,4,59.99,true),
  OURO(3,"Ouro",AppColors.ouro,2,79.99,false),
  DIAMANTE(4,"Diamante",AppColors.diamante,2,149.99,false);

  final int codigo;
  final String nomePlano;
  final Color corPlano;
  final int quantidadeProfissionaisPermitidos;
  final double valor;
  final bool recomendado;

  const PlanoUsoSaloonEnum(this.codigo, this.nomePlano, this.corPlano, this.quantidadeProfissionaisPermitidos, this.valor, this.recomendado);


}