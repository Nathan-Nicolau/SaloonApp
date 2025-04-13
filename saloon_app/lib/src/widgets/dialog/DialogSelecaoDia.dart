import 'package:flutter/material.dart';

import '../../utils/AppColors.dart';
import '../BotaoPrimario.dart';
import '../BotaoSecundario.dart';
import '../Texto.dart';

class DialogSelecaoDia extends StatefulWidget {

  Function(DateTime) onSelectDia;

  DialogSelecaoDia({required this.onSelectDia, super.key});

  @override
  State<DialogSelecaoDia> createState() => _DialogSelecaoDiaState();
}

class _DialogSelecaoDiaState extends State<DialogSelecaoDia> {

  DateTime diaSelecionado = DateTime.now();

  Future<void> _selecionarDia(BuildContext context) async {

    final DateTime? dia = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime(2026)
    );

    if (dia != null && dia != diaSelecionado) {
      setState(() {
        diaSelecionado = dia;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      backgroundColor: AppColors.branco,
      child: Wrap(
        children: [
          Padding(padding: const EdgeInsets.all(12), child:
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(12, 12, 12, 0) ,child:
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Texto(texto: "Dia selecionado:", tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto),
                  Texto(texto: " ${diaSelecionado.day.toString()}", tamanhoTexto: 16, peso: FontWeight.w600, cor: AppColors.azulPrincipal)
                ],
              )),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BotaoSecundario(onPressed: () {
                    _selecionarDia(context);
                  }, textoBotao: "Selecionar o dia"),
                  BotaoPrimario(onPressed: () {
                    setState(() {
                      widget.onSelectDia(diaSelecionado);
                      Navigator.pop(context);
                    });
                  }, textoBotao: "OK")
                ],
              ),
            ],
          )
          ),
        ],
      ),
    );
  }

}
