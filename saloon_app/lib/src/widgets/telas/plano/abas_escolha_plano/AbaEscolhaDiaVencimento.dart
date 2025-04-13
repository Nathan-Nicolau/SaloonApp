import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saloon_app/src/enums/PlanosUsoSaloonEnum.dart';
import 'package:saloon_app/src/utils/AppColors.dart';
import 'package:saloon_app/src/widgets/Texto.dart';
import 'package:saloon_app/src/widgets/cards/CardEscolhaPlano.dart';

class AbaEscolhaDiaVencimento extends StatefulWidget {

  final PlanoUsoSaloonEnum? planoSelecionado;
  final int? diaVencimentoEscolhido;
  Function(int) setDiaVencimentoEscolhido;

  AbaEscolhaDiaVencimento({required this.planoSelecionado, required this.diaVencimentoEscolhido, required this.setDiaVencimentoEscolhido,super.key});

  @override
  State<AbaEscolhaDiaVencimento> createState() => _AbaEscolhaDiaVencimentoState();

}

class _AbaEscolhaDiaVencimentoState extends State<AbaEscolhaDiaVencimento> {

  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.diaVencimentoEscolhido != null ? widget.diaVencimentoEscolhido.toString() : "");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            const Texto(texto: "Plano selecionado", tamanhoTexto: 16, peso: FontWeight.w600, cor: AppColors.preto),
            CardEscolhaPlano(plano: widget.planoSelecionado, selecionado: true, selecionarPlano: (valor) {}),
            const Texto(texto: "Escolha o dia de vencimento da sua assinatura", tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto),
            TextField(
              readOnly: true,
              controller: controller,
              keyboardType: TextInputType.number,
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700
              ),
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                prefixIcon: GestureDetector(
                  child: const Icon(Icons.event_rounded, size: 24, color: AppColors.azulPrincipal),
                  onTap: () {
                    // showDialog(context: context, builder: (builder) {
                    //   return DialogSelecaoDia(onSelectDia: (diaSelecionado) {
                    //     setState(() {
                    //       controller.text = diaSelecionado.day.toString();
                    //       widget.setDiaVencimentoEscolhido(diaSelecionado.day);
                    //     });
                    //   });
                    // });
                    //Validar a seleção aqui
                  },
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(value: false, onChanged: (valor) {}),
                Texto(texto: "Todo dia 1", tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto),
                Checkbox(value: false, onChanged: (valor) {}),
                Texto(texto: "Todo dia 1", tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto),
                Checkbox(value: false, onChanged: (valor) {}),
                Texto(texto: "Todo dia 1", tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto),
                Checkbox(value: false, onChanged: (valor) {}),
                Texto(texto: "Todo dia 1", tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto)
              ],
            )
          ],
        ),
      ),
    );
  }

}
