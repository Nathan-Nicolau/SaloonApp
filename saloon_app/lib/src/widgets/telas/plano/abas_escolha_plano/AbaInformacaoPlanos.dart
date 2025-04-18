import 'package:flutter/material.dart';
import 'package:saloon_app/src/utils/AppColors.dart';
import 'package:saloon_app/src/widgets/Texto.dart';
import 'package:saloon_app/src/widgets/cards/CardInformativo.dart';

class AbasInformacaoPlanos extends StatefulWidget {
  const AbasInformacaoPlanos({super.key});

  @override
  State<AbasInformacaoPlanos> createState() => _AbasInformacaoPlanosState();
}

class _AbasInformacaoPlanosState extends State<AbasInformacaoPlanos> {

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Texto(texto: "O sistema Saloon fornece várias opções de planos para melhor atender as necessidades do seu negócio",
                  tamanhoTexto: 16, peso: FontWeight.w600, cor: AppColors.preto),
              Texto(texto: "Cada plano possui uma quantidade máxima de profissionais e serviços* que você pode adicionar, dessa forma é possível aderir a uma escolha mais compatível com seu estabelecimento.",
                  tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto),
              SizedBox(height: 24),
              Texto(texto: "Cancele quando quiser, sem custos adicionais", tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto),
              SizedBox(height: 12),
              CardInformativo(mensagem: "O plano Diamante não possui limite no cadastro de serviços",icone: Icon(Icons.emergency, size: 8, color: AppColors.preto),corPrincipal: AppColors.preto)
            ],
          ),

      ),
    );
  }

}
