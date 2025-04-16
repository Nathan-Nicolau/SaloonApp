import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../widgets/Texto.dart';
import 'AppColors.dart';


class UtilsUI {

  static const padding = EdgeInsets.all(12);
  static const paddingMaior = EdgeInsets.all(24);

  static showToast(BuildContext context, String mensagem) {
    toastification.show(
      icon: const Icon(Icons.info_outline_rounded, size: 18, color: AppColors.azulPrincipal),
      context: context,
      boxShadow: [
        BoxShadow(color: AppColors.preto),
      ],
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      primaryColor: AppColors.azulPrincipal,
      style: ToastificationStyle.minimal,
      title: Texto(texto: mensagem, tamanhoTexto: 12, peso: FontWeight.w600, cor: AppColors.preto),
      backgroundColor: AppColors.azulLight,
      alignment: Alignment.topRight,
      autoCloseDuration: const Duration(seconds: 4),
      dismissDirection: DismissDirection.endToStart,
      applyBlurEffect: false,
    );
  }


}