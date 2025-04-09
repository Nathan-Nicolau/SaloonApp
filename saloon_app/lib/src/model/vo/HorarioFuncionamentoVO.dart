import 'package:saloon_app/src/enums/DiasSemanaEnum.dart';

class HorarioFuncionamentoVO {
  int? idHorarioFuncionamento;
  String? horarioAbertura;
  String? horarioSaida;
  String? horarioRetorno;
  String? horarioFechamento;
  String? diaSemanaFuncionamento;
  DateTime? dataCadastro;
  DateTime? dataAtualizacao;
  DiasSemanaEnum? diaSemanaEnum;

  //Para o cadastro inicial dos horários do estabelecimento
  HorarioFuncionamentoVO.simples() {
    horarioAbertura;
    horarioFechamento;
    diaSemanaFuncionamento;
    dataCadastro;
  }

  HorarioFuncionamentoVO.cadastro() {
    horarioAbertura;
    horarioFechamento;
    diaSemanaEnum;
  }

  HorarioFuncionamentoVO();

  int? getIdHorarioFuncionamento() => idHorarioFuncionamento;
  String? getHorarioAbertura() => horarioAbertura;
  String? getHorarioSaida() => horarioSaida;
  String? getHorarioRetorno() => horarioRetorno;
  String? getHorarioFechamento() => horarioFechamento;
  String? getDiaSemanaFuncionamento() => diaSemanaFuncionamento;
  DateTime? getDataCadastro() => dataCadastro;
  DateTime? getDataAtualizacao() => dataAtualizacao;
  DiasSemanaEnum? getDiaSemanaEnum() => diaSemanaEnum;

  void setIdHorarioFuncionamento(int idHorarioFuncionamento) {
    this.idHorarioFuncionamento = idHorarioFuncionamento;
  }

  void setHorarioAbertura(String horarioAbertura) {
    this.horarioAbertura = horarioAbertura;
  }

  void setHorarioSaida(String horarioSaida) {
    this.horarioSaida = horarioSaida;
  }

  void setHorarioRetorno(String horarioRetorno) {
    this.horarioRetorno = horarioRetorno;
  }

  void setHorarioFechamento(String horarioFechamento) {
    this.horarioFechamento = horarioFechamento;
  }

  void setDiaSemanaFuncionamento(String diaSemanaFuncionamento) {
    this.diaSemanaFuncionamento = diaSemanaFuncionamento;
  }

  void setDataCadastro(DateTime dataCadastro) {
    this.dataCadastro = dataCadastro;
  }

  void setDataAtualizacao(DateTime dataAtualizacao) {
    this.dataAtualizacao = dataAtualizacao;
  }

  void setDiaSemanaEnum(DiasSemanaEnum diaSemanaEnum) {
    this.diaSemanaEnum = diaSemanaEnum;
  }

}