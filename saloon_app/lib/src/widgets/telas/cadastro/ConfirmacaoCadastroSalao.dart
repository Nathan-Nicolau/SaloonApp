import 'package:flutter/material.dart';
import 'package:saloon_app/src/model/vo/SalaoVO.dart';
import 'package:saloon_app/src/utils/AppColors.dart';
import 'package:saloon_app/src/widgets/Texto.dart';

class ConfirmacaoCadastroSalao extends StatefulWidget {

  SalaoVO salaoVO;
  ConfirmacaoCadastroSalao({required this.salaoVO, super.key});

  @override
  State<ConfirmacaoCadastroSalao> createState() => _AbaConfirmacaoCadastroState();
}

class _AbaConfirmacaoCadastroState extends State<ConfirmacaoCadastroSalao> {

  void finalizarCadastro() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.branco,
        title: Texto(texto: "Confirmação de cadastro", tamanhoTexto: 18, peso: FontWeight.bold, cor: AppColors.preto),
      ),
      backgroundColor: AppColors.branco,
      body: SizedBox(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(

            spacing: 8,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Texto(texto: "Confirmando seu cadastro", tamanhoTexto: 16, peso: FontWeight.bold, cor: AppColors.preto)
                ],
              ),
              const Texto(texto: "Abaixo seus principais dados informados,que estarão visíveis para seus clientes", tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto),
              const Texto(texto: "Não se preocupe, você pode editar todos os valores posteriormente", tamanhoTexto: 12, peso: FontWeight.w300, cor: AppColors.preto),
              const SizedBox(height: 24),
              Texto(texto: "Nome do seu salão: ${widget.salaoVO.getProprietario()?.getNomeProprietario()}", tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto)
            ],
          ),
        ),
      ),
    );
  }

}
