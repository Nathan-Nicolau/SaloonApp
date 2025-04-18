import 'package:flutter/material.dart';
import 'package:saloon_app/src/enums/TipoUsuarioSaloon.dart';
import 'package:saloon_app/src/model/vo/UsuarioVO.dart';
import 'package:saloon_app/src/utils/AppColors.dart';
import 'package:saloon_app/src/widgets/Texto.dart';
import 'package:saloon_app/src/widgets/cards/CardInformativo.dart';

class CadastroSalaoEmAnaliseWidget extends StatefulWidget {

  static const String routeName = "/cadastrosalao-em-analise";

  const CadastroSalaoEmAnaliseWidget({super.key});

  @override
  State<CadastroSalaoEmAnaliseWidget> createState() => _CadastroSalaoEmAnaliseWidgetState();
}

class _CadastroSalaoEmAnaliseWidgetState extends State<CadastroSalaoEmAnaliseWidget> {

  @override
  Widget build(BuildContext context) {

    final UsuarioVO usuarioProprietario = ModalRoute.of(context)!.settings.arguments as UsuarioVO;

    return Scaffold(
      appBar: AppBar(
        title: const Texto(texto: "Confirmação de cadastro", tamanhoTexto: 18, peso: FontWeight.bold, cor: AppColors.preto),
      ),
      backgroundColor: AppColors.branco,
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TipoUsuarioSaloon.getTipoUsuarioPorCodigo(usuarioProprietario.getCodigoTipoUsuario()) == TipoUsuarioSaloon.PROPRIETARIO ?
            const Texto(texto: "Seu estabelecimento, serviços e horários informados foram previamente cadastrados",
                tamanhoTexto: 16, peso: FontWeight.w600, cor: AppColors.preto) : const SizedBox(height: 0,width: 0),
            const SizedBox(height: 8),
            const Texto(texto: "Seu cadastro está em um período de análise, e quando for validado, você poderá acessar o aplicativo com o usuário e senha cadastrados anteriormente",
                tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto),
            const CardInformativo(mensagem: "Não se preocupe, enviaremos uma notificação ao número de telefone informado quando seu cadastro for validado. Ou você pode retornar ao aplicativo e tentar realizar novamente o login"),
            const SizedBox(height: 12),
            const Texto(texto: "Usuário informado", tamanhoTexto: 12, peso: FontWeight.w300, cor: AppColors.cinza),
            Texto(texto: usuarioProprietario.getNomeUsuario() ?? "Não informado", tamanhoTexto: 14, peso: FontWeight.w600, cor: AppColors.preto),
            const Texto(texto: "Telefone informado", tamanhoTexto: 12, peso: FontWeight.w300, cor: AppColors.cinza),
            Texto(texto: usuarioProprietario.getTelefoneUsuario() ?? "Não informado", tamanhoTexto: 14, peso: FontWeight.w600, cor: AppColors.preto),
          ],
        ),
      ),
    );
  }

}
