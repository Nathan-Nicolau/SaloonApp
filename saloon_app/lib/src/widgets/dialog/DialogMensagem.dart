import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:saloon_app/src/utils/AppColors.dart';
import 'package:saloon_app/src/widgets/BotaoPrimario.dart';
import 'package:saloon_app/src/widgets/Texto.dart';

class DialogMensagem extends StatefulWidget {

  final String mensagem;
  final Function() onDismiss;

  const DialogMensagem({required this.mensagem, required this.onDismiss, super.key});

  @override
  State<DialogMensagem> createState() => _DialogMensagemState();
}

class _DialogMensagemState extends State<DialogMensagem> {
  @override
  Widget build(BuildContext context) {

    return Dialog(
      backgroundColor: AppColors.branco,
      elevation: 8,
      shadowColor: AppColors.azulPrincipal,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Wrap(
        children: [
          Padding(padding: EdgeInsets.all(12),
          child: Column(
            spacing: 2,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                      child: Row(
                        spacing: 4,
                        children: [
                          const Icon(Icons.info_outline_rounded, color: AppColors.azulPrincipal),
                          Texto(texto: "Aviso", tamanhoTexto: 18, peso: FontWeight.bold, cor: AppColors.preto)
                        ],
                      )),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(onPressed: () {
                        widget.onDismiss();
                      }, icon: const Icon(Icons.close_rounded, color: AppColors.vermelhoDark, size: 18))
                    ],
                  ))
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.all(12),
                  child: Center(
                    child: Texto(texto: widget.mensagem, tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto),
                  ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BotaoPrimario(onPressed: () {
                    widget.onDismiss();
                  }, textoBotao: "OK")
                ],
              )
            ],
          ))
        ],
    )).animate().fadeIn(duration: Duration(milliseconds: 100));
  }
}
