import 'package:flutter/material.dart';

import '../../utils/AppColors.dart';
import '../Texto.dart';

class CardInformativo extends StatelessWidget {

  final String mensagem;
  final Icon? icone;
  final Color? corBackground;
  final Color? corPrincipal;

  const CardInformativo({super.key, required this.mensagem, this.icone, this.corBackground, this.corPrincipal});

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 0,
      shadowColor: AppColors.cinza,
      color: corBackground ?? AppColors.cinzaClaro,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          child: Row(
            spacing: 8,
            children: [
              Flexible(flex: 1,child: icone ?? Icon(Icons.info_outline_rounded, size: 18,color: corPrincipal ?? AppColors.azulPrincipal)),
              Expanded(flex: 12,child: Texto(texto: mensagem, tamanhoTexto: 12, peso: FontWeight.w300, cor: AppColors.preto))
            ],
          ),
        ),
      ),
    );

  }
}
