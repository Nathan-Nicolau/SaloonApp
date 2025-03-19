import 'package:saloon_app/src/model/Usuario.dart';

// Classe de manipulação de valores da entidade Usuario

class UsuarioVO {
  late int? idUsuario;
  late String? loginUsuario;
  late String? senhausuario;
  late String? nomeUsuario;
  late String? emailUsuario;
  late String? telefoneUsuario;
  late DateTime? dataCadUsuario;
  late DateTime? dataAtuUsuario;

  UsuarioVO(
      this.idUsuario,
      this.loginUsuario,
      this.senhausuario,
      this.nomeUsuario,
      this.emailUsuario,
      this.telefoneUsuario,
      this.dataCadUsuario,
      this.dataAtuUsuario);

  UsuarioVO.login(
      this.loginUsuario,
      this.senhausuario);

  UsuarioVO.vazio() :
        idUsuario = 0,
        loginUsuario = "",
        senhausuario = "",
        nomeUsuario = "",
        emailUsuario = "",
        telefoneUsuario = "",
        dataCadUsuario = null,
        dataAtuUsuario = null;

  Usuario toUsuarioData() {
    return Usuario(idUsuario ?? 0,loginUsuario?? "",senhausuario ?? "",nomeUsuario ?? "",emailUsuario ?? "",telefoneUsuario ?? "",dataAtuUsuario ?? DateTime.now(),dataAtuUsuario ?? DateTime.now());
  }

}