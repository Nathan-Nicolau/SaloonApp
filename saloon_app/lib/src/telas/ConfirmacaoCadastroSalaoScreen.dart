import 'package:flutter/material.dart';
import 'package:saloon_app/src/model/vo/ConfirmacaoCadastroVO.dart';
import 'package:saloon_app/src/widgets/telas/cadastro/ConfirmacaoCadastroSalao.dart';

class ConfirmacaoCadastroScreen extends StatelessWidget {

  static const routeName = "/confirmacao-cadastro-proprietario";

  const ConfirmacaoCadastroScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final confirmacaoCadastro = ModalRoute.of(context)!.settings.arguments as ConfirmacaoCadastroVO;

    return ConfirmacaoCadastroSalao(confirmacaoCadastroVO: confirmacaoCadastro);

  }
}
