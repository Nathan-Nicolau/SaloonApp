enum StatusPlanoSalaoEnum {

  ATIVO(1,"Ativo"),
  SUSPENSO_SEM_PAGAMENTO(2,"Suspenso por falta de pagamento"),
  SENDO_ANALISADO(3,"Sendo analisado"),
  DESATIVADO(2,"Desativado");

  final int codigo;
  final String descricao;

  const StatusPlanoSalaoEnum(this.codigo, this.descricao);


}