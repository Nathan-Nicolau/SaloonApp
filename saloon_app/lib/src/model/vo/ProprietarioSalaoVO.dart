class ProprietarioVO {
  int? idProprietario;
  String? nomeProprietario;
  String? cpfProprietario;
  int? idUsuario;
  DateTime? dataCadastroProprietario;
  DateTime? dataAtualizacaoProprietario;

  int? getIdProprietario() => idProprietario;
  String? getNomeProprietario() => nomeProprietario;
  String? getCpfProprietario() => cpfProprietario;
  int? getIdUsuario() => idUsuario;
  DateTime? getDataCadastroProprietario() => dataCadastroProprietario;
  DateTime? getDataAtualizacaoProprietario() => dataAtualizacaoProprietario;

  void setIdProprietario(int idProprietario) {
    this.idProprietario = idProprietario;
  }

  void setNomeProprietario(String nomeProprietario) {
    this.nomeProprietario;
  }

  void setCpfProprietario(String cpfProprietario) {
    this.cpfProprietario = cpfProprietario;
  }

  void setIdUsuario(int idUsuario) {
    this.idUsuario = idUsuario;
  }

  void setDataCadastroProprietario(DateTime dataCadastro) {
    this.dataCadastroProprietario = dataCadastro;
  }

  void setDataAtualizacaoProprietario(DateTime dataAtualizacao) {
    this.dataAtualizacaoProprietario = dataAtualizacao;
  }

}