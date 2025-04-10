import 'package:flutter/material.dart';
import 'package:saloon_app/src/model/vo/SalaoVO.dart';
import 'package:saloon_app/src/widgets/telas/cadastro/ConfirmacaoCadastroSalao.dart';

class ConfirmacaoCadastroScreen extends StatelessWidget {

  static const routeName = "/confirmacaoCadastroProprietario";

  const ConfirmacaoCadastroScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final salaoVo = ModalRoute.of(context)!.settings.arguments as SalaoVO;

    return ConfirmacaoCadastroSalao(salaoVO: salaoVo);

  }
}
