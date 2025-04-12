//Essa classe serve como união do salão ao plano escolhido

class PlanoSalaoVO {
  int? idPlanoSalao;
  int? idPlanoUsoSaloon;
  //Recebe um valor do StatusPlanoSalaoEnum
  int? statusPlano;
  int? diaMesVencimento;
  DateTime? dataUltimoPagamento;
  DateTime? dataCadastro;
  DateTime? dataAtualizacao;

  int? getIdPlanoSalao() => idPlanoSalao;
  int? getIdPlanoUsoSaloon() => idPlanoUsoSaloon;
  int? getStatusPlano() => statusPlano;
  int? getDiaMesVencimento() => diaMesVencimento;
  DateTime? getDataUltimoPagamento() => dataUltimoPagamento;
  DateTime? getDataCadastro() => dataCadastro;
  DateTime? getDataAtualizacao() => dataAtualizacao;

  void setIdPlanoSalao(int idPlanoSalao) {
    this.idPlanoSalao = idPlanoSalao;
  }

  void setIdPlanoUsoSaloon(int idPlanoUsoSaloon) {
    this.idPlanoUsoSaloon = idPlanoUsoSaloon;
  }

  void setStatusPlano(int statusPlano) {
    this.statusPlano = statusPlano;
  }

  void setDiaMesVencimento(int diaMesVencimento) {
    this.diaMesVencimento = diaMesVencimento;
  }

  void setDataUltimoPagamento(DateTime dataUltimoPagamento) {
    this.dataUltimoPagamento = dataUltimoPagamento;
  }

  void setDataCadastro(DateTime dataCadastro) {
    this.dataCadastro = dataCadastro;
  }

  void setDataAtualizacao(DateTime dataAtualizacao) {
    this.dataAtualizacao = dataAtualizacao;
  }

}