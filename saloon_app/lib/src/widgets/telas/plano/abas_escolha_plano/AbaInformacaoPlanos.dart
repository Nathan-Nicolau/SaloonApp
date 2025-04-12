import 'package:flutter/material.dart';
import 'package:saloon_app/src/utils/AppColors.dart';
import 'package:saloon_app/src/widgets/Texto.dart';

class AbasInformacaoPlanos extends StatefulWidget {
  const AbasInformacaoPlanos({super.key});

  @override
  State<AbasInformacaoPlanos> createState() => _AbasInformacaoPlanosState();
}

class _AbasInformacaoPlanosState extends State<AbasInformacaoPlanos> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Texto(texto: "O sistema Saloon fornece várias opções de planos para melhor atender as necessidades do seu negócio",
                  tamanhoTexto: 16, peso: FontWeight.w600, cor: AppColors.preto),
              const Texto(texto: "Cada plano possui uma quantidade máxima de profissionais e serviços* que você pode adicionar, dessa forma é possível aderir a uma escolha mais compatível com seu estabelecimento.",
                  tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto),
              const SizedBox(height: 24),
              const Texto(texto: "Cancele quando quiser, sem custos adicionais", tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto),
              const SizedBox(height: 12),
              Card(
                elevation: 0,
                shadowColor: AppColors.cinza,
                color: AppColors.cinzaClaro,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: SizedBox(
                    child: Row(
                      spacing: 8,
                      children: [
                        Flexible(flex: 1,child: Icon(Icons.emergency, size: 8, color: AppColors.preto)),
                        Expanded(flex: 12,child: Texto(texto: "O plano Diamante não possui limite no cadastro de serviços", tamanhoTexto: 12, peso: FontWeight.w300, cor: AppColors.preto))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),

      ),
    );
  }

}
