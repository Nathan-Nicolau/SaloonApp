class ProfissionalVO {
  int? idProfissional;
  int? idUsuarioProfissional;
  int? idSalao;
  String? nomeCompletoProfissional;
  String? especializacaoProfissional;
  DateTime? dataCadastroProfissional;
  DateTime? dataAtualizacaoProfissional;

  int? getIdProfissional() => idProfissional;
  int? getIdUsuario() => idUsuarioProfissional;
  int? getIdSalao() => idSalao;
  String? getNomeProfissional() => nomeCompletoProfissional;
  String? getEspecializacao() => especializacaoProfissional;
  DateTime? getDataCadastro() => dataCadastroProfissional;
  DateTime? getDataAtualizacao() => dataAtualizacaoProfissional;

  void setIdProfissional(int idProfissional) {
    this.idProfissional = idProfissional;
  }

  void setIdUsuarioProfissional(int idUsuario) {
    this.idUsuarioProfissional = idUsuario;
  }

  void setIdSalao(int idSalao) {
    this.idSalao = idSalao;
  }

  void setNomeCompletoProfissional(String nomeCompletoProfissional) {
    this.nomeCompletoProfissional = nomeCompletoProfissional;
  }

  void setEspecializacao(String especializacao) {
    this.especializacaoProfissional = especializacao;
  }

  void setDataCadastro(DateTime dataCadastro) {
    this.dataCadastroProfissional = dataCadastro;
  }

  void setDataAtualizacao(DateTime dataAtualizacao) {
    this.dataAtualizacaoProfissional = dataAtualizacao;
  }

}