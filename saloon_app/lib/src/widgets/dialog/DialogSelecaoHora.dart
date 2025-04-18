import 'package:flutter/material.dart';
import 'package:saloon_app/src/utils/AppColors.dart';
import 'package:saloon_app/src/widgets/BotaoPrimario.dart';
import 'package:saloon_app/src/widgets/BotaoSecundario.dart';
import 'package:saloon_app/src/widgets/Texto.dart';

class DialogSelecaoHora extends StatefulWidget {

  Function(TimeOfDay) onHoraSelecionada;

  DialogSelecaoHora({required this.onHoraSelecionada, super.key});

  @override
  State<DialogSelecaoHora> createState() => _DialogSelecaoHoraState();
}

class _DialogSelecaoHoraState extends State<DialogSelecaoHora> {

  TimeOfDay horaSelecionada = TimeOfDay.now();

  Future<void> _selecionarHora(BuildContext context) async {
    final TimeOfDay? hora = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.inputOnly,
      context: context,
      initialTime: horaSelecionada,
    );
    if (hora != null && hora != horaSelecionada) {
      setState(() {
        horaSelecionada = hora;
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
                  Texto(texto: "Horário selecionado:", tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto),
                  Texto(texto: " ${horaSelecionada.format(context)}", tamanhoTexto: 16, peso: FontWeight.w600, cor: AppColors.azulPrincipal)
                ],
              )),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BotaoSecundario(onPressed: () {
                    _selecionarHora(context);
                  }, textoBotao: "Selecionar a hora"),
                  BotaoPrimario(onPressed: () {
                    setState(() {
                      widget.onHoraSelecionada(horaSelecionada);
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
