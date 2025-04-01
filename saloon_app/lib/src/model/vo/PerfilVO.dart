class PerfilVO {
  int? idConfigPerfil;
  int? idUsuario;
  String? fotoUsuario;
  bool? permiteNotificacoes;
  bool? permiteEmailLembrete;
  DateTime? dataCadastroPerfil;
  DateTime? dataAtualizacaoPerfil;

  int? getIdConfigPerfil() => idConfigPerfil;
  int? getIdUsuario() => idUsuario;
  String? getFotoPerfil() => fotoUsuario;
  bool? getPermiteNotificacoes() => permiteNotificacoes;
  bool? getPermiteEmailLembrete() => permiteEmailLembrete;
  DateTime? getDataCadastroPerfil() => dataCadastroPerfil;
  DateTime? getDataAtualizacaoPerfil() => dataAtualizacaoPerfil;

  void setIdConfigPerfil(int idConfigPerfil) {
    this.idConfigPerfil = idConfigPerfil;
  }

  void setIdUsuario(int idUsuario) {
    this.idUsuario = idUsuario;
  }

  void setFotoPerfil(String fotoUsuario) {
    this.fotoUsuario = fotoUsuario;
  }

  void setPermiteNotificacoes(bool permiteNotificacoes) {
    this.permiteNotificacoes = permiteNotificacoes;
  }

  void setPermiteEmailLembrete(bool permiteEmailLembrete) {
    this.permiteEmailLembrete = permiteEmailLembrete;
  }

  void setDataCadastroPerfil(DateTime dataCadastroPerfil) {
    this.dataCadastroPerfil = dataCadastroPerfil;
  }

  void setDataAtualizacaoPerfil(DateTime dataAtualizacaoPerfil) {
    this.dataAtualizacaoPerfil = dataAtualizacaoPerfil;
  }


}