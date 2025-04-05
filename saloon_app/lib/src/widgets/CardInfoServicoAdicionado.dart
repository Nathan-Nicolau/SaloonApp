import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:saloon_app/src/utils/AppColors.dart';
import 'package:saloon_app/src/widgets/Texto.dart';

class CardInfoServicoAdicionado extends StatefulWidget {

  final String descricaoServico;

  const CardInfoServicoAdicionado({required this.descricaoServico, super.key});

  @override
  State<CardInfoServicoAdicionado> createState() => _CardInfoServicoAdicionadoState();
}

class _CardInfoServicoAdicionadoState extends State<CardInfoServicoAdicionado> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.info_outline_rounded, size: 24,color: AppColors.azulPrincipal),
                Texto(texto: widget.descricaoServico, tamanhoTexto: 14, peso: FontWeight.bold, cor: AppColors.azulPrincipal),
                const Texto(texto: "adicionado com sucesso !", tamanhoTexto: 14, peso: FontWeight.w500, cor: AppColors.azulPrincipal),
              ],
            ),
          ),
        ),
      ).animate().slideX(duration: Duration(milliseconds: 800)
      ).fadeIn(duration: Duration(seconds: 1))
    );
  }

}
