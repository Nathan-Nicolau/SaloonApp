import 'package:saloon_app/src/model/Usuario.dart';

// Classe de manipulação de valores da entidade Usuario

class UsuarioVO {
    int? idUsuario;
    String? loginUsuario;
    String? senhaUsuario;
    String? confirmacaoSenha;
    String? nomeUsuario;
    String? emailUsuario;
    String? telefoneUsuario;
    DateTime? dataCadUsuario;
    DateTime? dataAtuUsuario;


  Usuario toUsuarioData() {
    return Usuario(idUsuario ?? 0,loginUsuario?? "",senhaUsuario ?? "",nomeUsuario ?? "",emailUsuario ?? "",telefoneUsuario ?? "",dataAtuUsuario ?? DateTime.now(),dataAtuUsuario ?? DateTime.now());
  }

  UsuarioVO();

  int? getIdUsuario() => idUsuario;
  String? getLoginUsuario() => loginUsuario;
  String? getSenhausuario() => senhaUsuario;
  String? getConfirmacaoSenha() => confirmacaoSenha;
  String? getNomeUsuario() => nomeUsuario;
  String? getEmailUsuario() => emailUsuario;
  String? getTelefoneUsuario() => telefoneUsuario;
  DateTime? getDataCadastroUsuario() => dataCadUsuario;
  DateTime? getDataAtualizacaoUsuario() => dataAtuUsuario;

  void setIdUsuario(int idUsuario) {
    this.idUsuario = idUsuario;
  }

  void setLoginUsuario(String loginUsuario) {
    this.loginUsuario = loginUsuario;
  }

  void setSenhaUsuario(String senhaUsuario) {
    this.senhaUsuario  = senhaUsuario;
  }

  void setConfirmacaoSenha(String confirmacaoSenha) {
    this.confirmacaoSenha = confirmacaoSenha;
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