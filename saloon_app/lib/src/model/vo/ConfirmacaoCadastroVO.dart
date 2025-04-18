import 'package:saloon_app/src/model/vo/ProfissionalVO.dart';
import 'package:saloon_app/src/model/vo/ProprietarioSalaoVO.dart';
import 'package:saloon_app/src/model/vo/SalaoVO.dart';
import 'package:saloon_app/src/model/vo/UsuarioVO.dart';

class ConfirmacaoCadastroVO {
  UsuarioVO? usuarioVO;
  ProprietarioVO? proprietarioVO;
  SalaoVO? salaoVO;
  ProfissionalVO? profissionalVO;

  UsuarioVO? getUsuario() => usuarioVO;
  ProprietarioVO? getProprietario() => proprietarioVO;
  SalaoVO? getSalao() => salaoVO;
  ProfissionalVO? getProfissional() => profissionalVO;

  void setUsuario(UsuarioVO usuario) {
    this.usuarioVO = usuario;
  }

  void setProprietario(ProprietarioVO proprietario) {
    this.proprietarioVO = proprietario;
  }

  void setSalao(SalaoVO salao) {
    this.salaoVO = salao;
  }

  void setProfissional(ProfissionalVO profissional) {
    this.profissionalVO = profissional;
  }

}