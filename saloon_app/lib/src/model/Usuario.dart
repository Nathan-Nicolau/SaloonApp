
import 'package:saloon_app/src/model/vo/UsuarioVO.dart';

// Classe de entidade do usuário

class Usuario {

  late int idUsuario;
  late String loginUsuario;
  late String senhausuario;
  late String nomeUsuario;
  late String emailUsuario;
  late String telefoneUsuario;
  late DateTime dataCadUsuario;
  late DateTime dataAtuUsuario;

  Usuario(
      this.idUsuario,
      this.loginUsuario,
      this.senhausuario,
      this.nomeUsuario,
      this.emailUsuario,
      this.telefoneUsuario,
      this.dataCadUsuario,
      this.dataAtuUsuario);

  UsuarioVO getUsuarioVo() {
    return UsuarioVO(idUsuario, loginUsuario, senhausuario, nomeUsuario, emailUsuario, telefoneUsuario, dataCadUsuario, dataAtuUsuario);
  }

  String get getSenhaUsuario {
    return senhausuario;
  }

  set setSenhaUsuario(String senha) {
    senhausuario = senha;
  }

  String get getNomeUsuario {
    return nomeUsuario;
  }

  set setNomeUsuario(String nome) {
    nomeUsuario = nome;
  }

  String get getEmailUsuario {
    return emailUsuario;
  }

  set setEmailUsuario(String email) {
    emailUsuario = email;
  }

  String get getTelefoneUsuario {
    return telefoneUsuario;
  }

  set setTelefoneUsuario(String telefone) {
      telefoneUsuario = telefone;
  }

  DateTime get getDataCadUsuario {
    return dataCadUsuario;
  }

  set setDataCadUsuario(DateTime data) {
    dataCadUsuario = data;
  }

  DateTime get getDataAtuUsuario {
    return dataAtuUsuario;
  }

  set setDataAtuUsuario(DateTime data) {
    dataAtuUsuario = data;
  }

}