class CategoriaServicoVO { //value object
  int? idCategoriaServico;
  String? descricaoCategoriaServico;
  DateTime? dataCadastroCategServico;
  DateTime? dataAtuCategServico;

  int? getIdCategoriaServico() => idCategoriaServico;
  String? getDescricaoCategoriaServico() => descricaoCategoriaServico;
  DateTime? getDataCadastroCategServico() => dataCadastroCategServico;
  DateTime? getDataAtualizacaoCategServico() => dataAtuCategServico;

  CategoriaServicoVO(int codigo, String descricao) {
    this.idCategoriaServico = codigo;
    this.descricaoCategoriaServico = descricao;
  }

  void setIdCategoriaServico(int idCategoriaServico) {
    this.idCategoriaServico = idCategoriaServico;
  }

  void setDescricaoCategoriaServico(String descricaoCategoriaServico) {
    this.descricaoCategoriaServico = descricaoCategoriaServico;
  }

  void setDataCadastroCategoriaServico(DateTime dataCadastroCategoriaServico) {
    this.dataCadastroCategServico = dataCadastroCategoriaServico;
  }

  void setDataAtualizacaoCategoriaServico(DateTime dataAtualizacaoCategoriaServico) {
    this.dataAtuCategServico = dataAtualizacaoCategoriaServico;
  }

}