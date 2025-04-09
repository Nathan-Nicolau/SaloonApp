import 'package:flutter/material.dart';
import 'package:saloon_app/src/model/vo/SalaoVO.dart';
import 'package:saloon_app/src/widgets/telas/cadastro/ConfirmacaoCadastroSalao.dart';

class ConfirmacaoCadastroScreen extends StatelessWidget {

  final SalaoVO salaoVO;
  const ConfirmacaoCadastroScreen({required this.salaoVO, super.key});

  @override
  Widget build(BuildContext context) {
    return ConfirmacaoCadastroSalao(salaoVO: salaoVO);
  }
}
