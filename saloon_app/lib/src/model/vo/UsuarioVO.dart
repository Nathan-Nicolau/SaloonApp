import 'package:saloon_app/src/model/Usuario.dart';

// Classe de manipulação de valores da entidade Usuario

class UsuarioVO {
    int? idUsuario;
    String? loginUsuario;
    String? senhaUsuario;
    String? nomeUsuario;
    String? emailUsuario;
    String? telefoneUsuario;
    DateTime? dataCadUsuario;
    DateTime? dataAtuUsuario;

  UsuarioVO(
      this.idUsuario,
      this.loginUsuario,
      this.senhaUsuario,
      this.nomeUsuario,
      this.emailUsuario,
      this.telefoneUsuario,
      this.dataCadUsuario,
      this.dataAtuUsuario);

  UsuarioVO.login(
      this.loginUsuario,
      this.senhaUsuario);

  UsuarioVO.vazio() :
        idUsuario = 0,
        loginUsuario = "",
        senhaUsuario = "",
        nomeUsuario = "",
        emailUsuario = "",
        telefoneUsuario = "",
        dataCadUsuario = null,
        dataAtuUsuario = null;

  Usuario toUsuarioData() {
    return Usuario(idUsuario ?? 0,loginUsuario?? "",senhaUsuario ?? "",nomeUsuario ?? "",emailUsuario ?? "",telefoneUsuario ?? "",dataAtuUsuario ?? DateTime.now(),dataAtuUsuario ?? DateTime.now());
  }

  int getIdUsuario() => idUsuario ?? 0;
  String getLoginUsuario() => loginUsuario ?? "";
  String getSenhausuario() => senhaUsuario ?? "";
  String getNomeUsuario() => nomeUsuario ?? "";
  String getEmailUsuario() => emailUsuario ?? "";
  String getTelefoneUsuario() => telefoneUsuario ?? "";
  DateTime getDataCadastroUsuario() => dataCadUsuario ?? DateTime.now();
  DateTime getDataAtualizacaoUsuario() => dataAtuUsuario ?? DateTime.now();

  void setIdUsuario(int idUsuario) {
    this.idUsuario = idUsuario;
  }

  void setLoginUsuario(String loginUsuario) {
    this.loginUsuario = loginUsuario;
  }

  void setSenhaUsuario(String senhaUsuario) {
    this.senhaUsuario  = senhaUsuario;
  }

  void setNomeUsuario(String nomeUsuario) {
    this.nomeUsuario = nomeUsuario;
  }

  void setEmailUsuario(String emailUsuario) {
    this.emailUsuario = emailUsuario;
  }

  void setTelefoneUsuario(String telefoneUsuario) {
    this.telefoneUsuario = telefoneUsuario;
  }

  void setDataCadUsuario(DateTime dataCadUsuario) {
    this.dataCadUsuario = dataCadUsuario;
  }

  void setDataAtuUsuario(DateTime dataAtuUsuario) {
    this.dataAtuUsuario = dataAtuUsuario;
  }


}