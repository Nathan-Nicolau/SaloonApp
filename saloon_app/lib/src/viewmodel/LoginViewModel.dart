import 'package:saloon_app/src/enums/LoginEnum.dart';
import 'package:saloon_app/src/model/vo/UsuarioVO.dart';

class LoginViewModel {

  Future<LoginEnum> realizarLogin(UsuarioVO usuarioLogin) async {
    return Future.value(LoginEnum.LOGIN_CORRETO);
  }

  bool recuperarUsuario(UsuarioVO usuarioInformado)  {
    return usuarioInformado != UsuarioVO.vazio();
  }

}