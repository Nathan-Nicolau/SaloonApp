import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saloon_app/src/utils/AppColors.dart';

class BotaoLoading extends StatelessWidget {

  final Future<bool> Function() onPressed;
  final String textoBotao;
  final botaoHabilitado = ValueNotifier<bool>(true);
  final exibirCarregamento = ValueNotifier<bool>(false);

  BotaoLoading({required this.onPressed, required this.textoBotao, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(onPressed: ()  {
        botaoHabilitado.value == !botaoHabilitado.value;

          exibirCarregamento.value = !exibirCarregamento.value;
          onPressed().then((valor) {
            botaoHabilitado.value = !botaoHabilitado.value;
            exibirCarregamento.value = valor;
          });

      },
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            backgroundColor: const WidgetStatePropertyAll(AppColors.azulPrincipal),
            elevation: const WidgetStatePropertyAll(1),
          ),
          child: AnimatedBuilder(animation: exibirCarregamento, builder: (context,_) {
            return exibirCarregamento.value ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: AppColors.branco,
              ),
            ) : Text(textoBotao, style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.branco
            ));
          })
      ) ,
    );
  }


}
