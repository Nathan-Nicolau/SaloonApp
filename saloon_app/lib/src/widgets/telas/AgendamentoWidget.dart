import 'package:flutter/material.dart';
import 'package:saloon_app/src/model/vo/AgendamentoRapidoVO.dart';
import 'package:saloon_app/src/model/vo/AgendamentoVO.dart';
import 'package:saloon_app/src/utils/AppColors.dart';
import 'package:saloon_app/src/widgets/Texto.dart';

class AgendamentoWidget extends StatefulWidget {
  const AgendamentoWidget({super.key});

  @override
  State<AgendamentoWidget> createState() => _AgendamentoWidgetState();
}

class _AgendamentoWidgetState extends State<AgendamentoWidget> {

  AgendamentoRapidoVO agendamentoRapidoVO = AgendamentoRapidoVO.agendamentoRapidoVazio;
  AgendamentoVO agendamentoVO = AgendamentoVO.agendamentoVazioVo;

  int currentIndex = 1; // Índice da tela atual

  void atribuirInformacoesIniciaisAgendamento(AgendamentoRapidoVO agendamentoRapido) {
    setState(() {
      agendamentoRapidoVO = agendamentoRapido;
    });
  }

  final List<Widget> screens = [
    Center(child: Text("Tela 1")),
    Center(child: Text("Tela 2")),
    Center(child: Text("Tela 3")),
    Center(child: Text("Tela 4")),
    Center(child: Text("Tela 5 - Final")),
  ];

  void nextPage() {
    if (currentIndex < screens.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void previousPage() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Top app bar permanece fixo
      appBar: AppBar(title: const Texto(texto: "Agendamento rápido",tamanhoTexto: 16,peso: FontWeight.w600,cor: AppColors.preto)),
      body: Column(
        children: [
          IndexedStack(
            index: currentIndex,
            children: screens,
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            currentIndex > 0 ? ElevatedButton(onPressed: currentIndex > 0 ? previousPage : null,
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(currentIndex > 0 ? AppColors.azulPrincipal: AppColors.tomCinza),
                  elevation: const WidgetStatePropertyAll(2),
                  shape: const WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))))
              ),
              child: const Texto(texto: "Voltar", tamanhoTexto: 14, peso: FontWeight.w500, cor: AppColors.branco),
            ) : Container(),
            currentIndex < screens.length -1 ? ElevatedButton(
              onPressed: currentIndex < screens.length - 1 ? nextPage : null,
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.azulPrincipal),
                elevation: WidgetStatePropertyAll(2),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))))),
              child: const Texto(texto: "Avançar", tamanhoTexto: 14, peso: FontWeight.w500,cor: AppColors.branco)) :
            //Botão de finalização do processo de agendamento
            ElevatedButton(
                onPressed: () {

                },
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(AppColors.azulPrincipal),
                    elevation: WidgetStatePropertyAll(2),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))))),
                child: const Texto(texto: "Finalizar",tamanhoTexto: 14, peso: FontWeight.w500,cor: AppColors.branco)
            )
          ],
        ),
      ),
    );
  }
}
