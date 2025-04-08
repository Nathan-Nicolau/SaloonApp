import 'package:flutter/material.dart';

class HorarioFuncionamentoItem extends StatefulWidget {
  final String diaDaSemana;
  final bool selecionadoInicialmente;
  final String horaInicioInicial;
  final String horaFimInicial;
  final ValueChanged<bool>? onChanged;
  final ValueChanged<String>? onHoraInicioChanged;
  final ValueChanged<String>? onHoraFimChanged;

  const HorarioFuncionamentoItem({
    Key? key,
    required this.diaDaSemana,
    this.selecionadoInicialmente = false,
    this.horaInicioInicial = '09:00',
    this.horaFimInicial = '17:00',
    this.onChanged,
    this.onHoraInicioChanged,
    this.onHoraFimChanged,
  }) : super(key: key);

  @override
  _HorarioFuncionamentoItemState createState() => _HorarioFuncionamentoItemState();
}

class _HorarioFuncionamentoItemState extends State<HorarioFuncionamentoItem> {
  bool _selecionado = false;
  TextEditingController _horaInicioController = TextEditingController();
  TextEditingController _horaFimController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selecionado = widget.selecionadoInicialmente;
    _horaInicioController.text = widget.horaInicioInicial;
    _horaFimController.text = widget.horaFimInicial;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _selecionado,
                      onChanged: (bool? value) {
                        setState(() {
                          _selecionado = value!;
                        });
                        if (widget.onChanged != null) {
                          widget.onChanged!(value!);
                        }
                      },
                    ),
                    Text(widget.diaDaSemana),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _horaInicioController,
                        decoration: InputDecoration(
                          hintText: '00:00',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                        onChanged: (value) {
                          if (widget.onHoraInicioChanged != null) {
                            widget.onHoraInicioChanged!(value);
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('às'),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _horaFimController,
                        decoration: InputDecoration(
                          hintText: '00:00',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                        onChanged: (value) {
                          if (widget.onHoraFimChanged != null) {
                            widget.onHoraFimChanged!(value);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 8.0), // Espaço entre os TextFields e o botão
          // Você pode adicionar o botão aqui, se necessário
          // IconButton(
          //   icon: Icon(Icons.add),
          //   onPressed: () {
          //     // Lógica do botão
          //   },
          // ),
        ],
      ),
    );
  }
}

class HorarioFuncionamentoLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HorarioFuncionamentoItem(
          diaDaSemana: 'Segunda-feira',
          selecionadoInicialmente: true,
          horaInicioInicial: '09:00',
          horaFimInicial: '17:00',
          onChanged: (value) {
            print('Segunda-feira selecionado: $value');
          },
          onHoraInicioChanged: (value) {
            print('Segunda-feira hora de início: $value');
          },
          onHoraFimChanged: (value) {
            print('Segunda-feira hora de fim: $value');
          },
        ),
        HorarioFuncionamentoItem(
          diaDaSemana: 'Terça-feira',
          onChanged: (value) {
            print('Terça-feira selecionado: $value');
          },
          onHoraInicioChanged: (value) {
            print('Terça-feira hora de início: $value');
          },
          onHoraFimChanged: (value) {
            print('Terça-feira hora de fim: $value');
          },
        ),
        HorarioFuncionamentoItem(
          diaDaSemana: 'Quarta-feira',
          selecionadoInicialmente: true,
          horaInicioInicial: '09:00',
          horaFimInicial: '17:00',
          onChanged: (value) {
            print('Quarta-feira selecionado: $value');
          },
          onHoraInicioChanged: (value) {
            print('Quarta-feira hora de início: $value');
          },
          onHoraFimChanged: (value) {
            print('Quarta-feira hora de fim: $value');
          },
        ),
        // Adicione mais HorarioFuncionamentoItem para os outros dias da semana
      ],
    );
  }
}