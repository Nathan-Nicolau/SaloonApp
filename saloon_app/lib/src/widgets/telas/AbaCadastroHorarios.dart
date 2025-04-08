import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saloon_app/src/model/vo/HorarioFuncionamentoCompletoVO.dart';

import '../../model/vo/HorarioFuncionamentoVO.dart';
import '../../utils/AppColors.dart';
import '../Texto.dart';
import '../dialog/DialogSelecaoHora.dart';

class AbaCadastroHorarios extends StatefulWidget {

  Function(HorarioFuncionamentoCompletoVO horarioCompleto) setHorarios;
  AbaCadastroHorarios({required this.setHorarios, super.key});

  @override
  State<AbaCadastroHorarios> createState() => _AbaCadastroHorariosState();
}

class _AbaCadastroHorariosState extends State<AbaCadastroHorarios> {

  bool segunda = false;
  bool terca = false;
  bool quarta = false;
  bool quinta= false;
  bool sexta = false;
  bool sabado = false;
  bool domingo = false;

  HorarioFuncionamentoVO horarioSegunda = HorarioFuncionamentoVO();
  HorarioFuncionamentoVO horarioTerca = HorarioFuncionamentoVO();
  HorarioFuncionamentoVO horarioQuarta = HorarioFuncionamentoVO();
  HorarioFuncionamentoVO horarioQuinta = HorarioFuncionamentoVO();
  HorarioFuncionamentoVO horarioSexta = HorarioFuncionamentoVO();
  HorarioFuncionamentoVO horarioSabado = HorarioFuncionamentoVO();
  HorarioFuncionamentoVO horarioDomingo = HorarioFuncionamentoVO();

  late TextEditingController segundaAberturaController;
  late TextEditingController segundaFechamentoController;
  late TextEditingController tercaAberturaController;
  late TextEditingController tercaFechamentoController;
  late TextEditingController quartaAberturaController;
  late TextEditingController quartaFechamentoController;
  late TextEditingController quintaAberturaController;
  late TextEditingController quintaFechamentoController;
  late TextEditingController sextaAberturaController;
  late TextEditingController sextaFechamentoController;
  late TextEditingController sabadoAberturaController;
  late TextEditingController sabadoFechamentoController;
  late TextEditingController domingoAberturaController;
  late TextEditingController domingoFechamentoController;

  @override
  void initState() {
    super.initState();
    segundaAberturaController = TextEditingController(text: horarioSegunda.getHorarioAbertura());
    segundaFechamentoController = TextEditingController(text: horarioSegunda.getHorarioFechamento());
    tercaAberturaController = TextEditingController(text: horarioTerca.getHorarioAbertura());
    tercaFechamentoController = TextEditingController(text: horarioTerca.getHorarioFechamento());
    quartaAberturaController = TextEditingController(text: horarioQuarta.getHorarioAbertura());
    quartaFechamentoController = TextEditingController(text: horarioQuarta.getHorarioFechamento());
    quintaAberturaController = TextEditingController(text: horarioQuinta.getHorarioAbertura());
    quintaFechamentoController = TextEditingController(text: horarioQuinta.getHorarioFechamento());
    sextaAberturaController = TextEditingController(text: horarioSexta.getHorarioAbertura());
    sextaFechamentoController = TextEditingController(text: horarioSexta.getHorarioFechamento());
    sabadoAberturaController = TextEditingController(text: horarioSabado.getHorarioAbertura());
    sabadoFechamentoController = TextEditingController(text: horarioSabado.getHorarioFechamento());
    domingoAberturaController = TextEditingController(text: horarioDomingo.getHorarioAbertura());
    domingoFechamentoController = TextEditingController(text: horarioDomingo.getHorarioFechamento());
  }



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                  child: Column(
                    children: [
                      Texto(texto: "Informe os dias de funcionamento do seu estabelecimento", tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto),
                      Texto(texto: "Ao informar os horários, prefira por valores de hora completa, como 08:00 e 18:00", tamanhoTexto: 12, peso: FontWeight.w300, cor: AppColors.preto),
                    ],
                  )),
              const Padding(
                padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                child: Row(
                  children: [
                    Texto(texto: "Você pode alterar essa informações depois", tamanhoTexto: 12, peso: FontWeight.w300, cor: AppColors.preto),
                  ],
                ),
              ),
              //Segunda-feira
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      width: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                              value: segunda,
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                              onChanged: (valor) {
                                setState(() {
                                  segunda = valor!;
                                });
                              }
                          ),
                          const Texto(texto: "Segunda", tamanhoTexto: 14, peso: FontWeight.w500, cor: AppColors.preto),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Texto(texto: "de", tamanhoTexto: 14, peso: FontWeight.w300, cor: AppColors.preto),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            readOnly: true,
                            textAlignVertical: TextAlignVertical.center,
                            onChanged: (valorAbertura) {
                              setState(() {
                                horarioSegunda.setHorarioAbertura(valorAbertura);
                              });
                            },
                            enabled: segunda,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                            ),
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                                prefixIcon: GestureDetector(
                                  child: const Icon(Icons.access_time_rounded, size: 24, color: AppColors.azulPrincipal),
                                  onTap: () {
                                    if(segunda) {
                                      showDialog(context: context, builder: (builder) {
                                        return DialogSelecaoHora(onHoraSelecionada: (hora) {
                                          setState(() {
                                            horarioSegunda.setHorarioAbertura(hora.format(context));
                                            segundaAberturaController.text = horarioSegunda.getHorarioAbertura().toString();
                                          });
                                        });
                                      });
                                    }
                                  },
                                ),
                                hintText: "08:00",
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.cinza
                                )
                            ),
                            controller: segundaAberturaController,
                          ),
                        ),
                        const Texto(texto: "às", tamanhoTexto: 14, peso: FontWeight.w300, cor: AppColors.preto),
                        Expanded(
                          child: TextField(
                            readOnly: true,
                            textAlignVertical: TextAlignVertical.center,
                            onChanged: (valorFechamento) {
                              setState(() {
                                horarioSegunda.setHorarioFechamento(valorFechamento);
                              });
                            },
                            enabled: segunda,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                            ),
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                                prefixIcon: GestureDetector(
                                  child: const Icon(Icons.access_time_rounded, size: 24, color: AppColors.azulPrincipal),
                                  onTap: (() {
                                    if(segunda) {
                                      showDialog(context: context, builder: (builder) {
                                        return DialogSelecaoHora(onHoraSelecionada: (hora) {
                                          setState(() {
                                            horarioSegunda.setHorarioFechamento(hora.format(context));
                                            segundaFechamentoController.text = horarioSegunda.getHorarioFechamento().toString();
                                          });
                                        });
                                      });
                                    }
                                  }
                                  ),
                                ),
                                hintText: "18:00",
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.cinza
                                )
                            ),
                            controller: segundaFechamentoController,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              //Terça-feira
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      width:120,
                      child: Row(
                        children: [
                          Checkbox(
                              value: terca,
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                              onChanged: (valor) {
                                setState(() {
                                  terca = valor!;
                                });
                              }
                          ),
                          const Texto(texto: "Terça", tamanhoTexto: 14, peso: FontWeight.w500, cor: AppColors.preto)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        const Texto(texto: "de", tamanhoTexto: 14, peso: FontWeight.w300, cor: AppColors.preto),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            readOnly: true,
                            textAlignVertical: TextAlignVertical.center,
                            onChanged: (valorAbertura) {
                              setState(() {
                                horarioTerca.setHorarioAbertura(valorAbertura);
                              });
                            },
                            enabled: terca,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                            ),
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                                prefixIcon: GestureDetector(
                                    child: const Icon(Icons.access_time_rounded, size: 24, color: AppColors.azulPrincipal),
                                    onTap: () {
                                      if(terca) {
                                        showDialog(context: context, builder: (builder) {
                                          return DialogSelecaoHora(onHoraSelecionada: (hora) {
                                            setState(() {
                                              horarioTerca.setHorarioAbertura(hora.format(context));
                                              tercaAberturaController.text = horarioTerca.getHorarioAbertura().toString();
                                            });
                                          });
                                        });
                                      }
                                    }
                                ),
                                hintText: "08:00",
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.cinza
                                )
                            ),
                            controller: tercaAberturaController,
                          ),
                        ),
                        const Texto(texto: "às", tamanhoTexto: 14, peso: FontWeight.w300, cor: AppColors.preto),
                        Expanded(
                          child: TextField(
                            readOnly: true,
                            textAlignVertical: TextAlignVertical.center,
                            onChanged: (valorFechamento) {
                              setState(() {
                                horarioTerca.setHorarioFechamento(valorFechamento);
                              });
                            },
                            enabled: terca,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                            ),
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                                prefixIcon: GestureDetector(
                                    child: const Icon(Icons.access_time_rounded, size: 24, color: AppColors.azulPrincipal),
                                    onTap: () {
                                      if(terca) {
                                        showDialog(context: context, builder: (builder) {
                                          return DialogSelecaoHora(onHoraSelecionada: (hora) {
                                            setState(() {
                                              horarioTerca.setHorarioFechamento(hora.format(context));
                                              tercaFechamentoController.text = horarioTerca.getHorarioFechamento().toString();
                                            });
                                          });
                                        });
                                      }
                                    }
                                ),
                                hintText: "18:00",
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.cinza
                                )
                            ),
                            controller: tercaFechamentoController,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              //Quarta feira
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      width: 120,
                      child: Row(
                        children: [
                          Checkbox(
                              value: quarta,
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                              onChanged: (valor) {
                                setState(() {
                                  quarta = valor!;
                                });
                              }
                          ),
                          const Texto(texto: "Quarta", tamanhoTexto: 14, peso: FontWeight.w500, cor: AppColors.preto)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        const Texto(texto: "de", tamanhoTexto: 14, peso: FontWeight.w300, cor: AppColors.preto),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            readOnly: true,
                            textAlignVertical: TextAlignVertical.center,
                            onChanged: (valorAbertura) {
                              setState(() {
                                horarioQuarta.setHorarioAbertura(valorAbertura);
                              });
                            },
                            enabled: quarta,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                            ),
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                                prefixIcon: GestureDetector(
                                  child: const Icon(Icons.access_time_rounded, size: 24, color: AppColors.azulPrincipal),
                                  onTap: () {
                                    if(quarta) {
                                      showDialog(context: context, builder: (builder) {
                                        return DialogSelecaoHora(onHoraSelecionada: (hora) {
                                          setState(() {
                                            horarioQuarta.setHorarioAbertura(hora.format(context));
                                            quartaAberturaController.text = horarioQuarta.getHorarioAbertura().toString();
                                          });
                                        });
                                      });
                                    }
                                  },
                                ),
                                hintText: "08:00",
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.cinza
                                )
                            ),
                            controller: quartaAberturaController,
                          ),
                        ),
                        const Texto(texto: "às", tamanhoTexto: 14, peso: FontWeight.w300, cor: AppColors.preto),
                        Expanded(
                          child: TextField(
                            readOnly: true,
                            textAlignVertical: TextAlignVertical.center,
                            onChanged: (valorFechamento) {
                              setState(() {
                                horarioQuarta.setHorarioFechamento(valorFechamento);
                              });
                            },
                            enabled: quarta,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                            ),
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                                prefixIcon: GestureDetector(
                                  child: const Icon(Icons.access_time_rounded, size: 24, color: AppColors.azulPrincipal),
                                  onTap: () {
                                    if(quarta) {
                                      showDialog(context: context, builder: (builder) {
                                        return DialogSelecaoHora(onHoraSelecionada: (hora) {
                                          setState(() {
                                            horarioQuarta.setHorarioFechamento(hora.format(context));
                                            quartaFechamentoController.text = horarioQuarta.getHorarioFechamento().toString();
                                          });
                                        });
                                      });
                                    }
                                  },
                                ),
                                hintText: "18:00",
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.cinza
                                )
                            ),
                            controller: quartaFechamentoController,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              //Quinta-feira
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      width: 120,
                      child: Row(
                        children: [
                          Checkbox(
                              value: quinta,
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                              onChanged: (valor) {
                                setState(() {
                                  quinta = valor!;
                                });
                              }
                          ),
                          const Texto(texto: "Quinta", tamanhoTexto: 14, peso: FontWeight.w500, cor: AppColors.preto)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [const Texto(texto: "de", tamanhoTexto: 14, peso: FontWeight.w300, cor: AppColors.preto),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            readOnly: true,
                            textAlignVertical: TextAlignVertical.center,
                            onChanged: (valorAbertura) {
                              setState(() {
                                horarioQuinta.setHorarioAbertura(valorAbertura);
                              });
                            },
                            enabled: quinta,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                            ),
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                                prefixIcon: GestureDetector(
                                    child: const Icon(Icons.access_time_rounded, size: 24, color: AppColors.azulPrincipal),
                                    onTap: () {
                                      if(quinta) {
                                        showDialog(context: context, builder: (builder) {
                                          return DialogSelecaoHora(onHoraSelecionada: (hora) {
                                            setState(() {
                                              horarioQuinta.setHorarioAbertura(hora.format(context));
                                              quintaAberturaController.text = horarioQuinta.getHorarioAbertura().toString();
                                            });
                                          });
                                        });
                                      }
                                    }
                                ),
                                hintText: "08:00",
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.cinza
                                )
                            ),
                            controller: quintaAberturaController,
                          ),
                        ),
                        const Texto(texto: "às", tamanhoTexto: 14, peso: FontWeight.w300, cor: AppColors.preto),
                        Expanded(
                          child: TextField(
                            readOnly: true,
                            textAlignVertical: TextAlignVertical.center,
                            onChanged: (valorFechamento) {
                              setState(() {
                                horarioQuinta.setHorarioFechamento(valorFechamento);
                              });
                            },
                            enabled: quinta,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                            ),
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                                prefixIcon: GestureDetector(
                                    child: const Icon(Icons.access_time_rounded, size: 24, color: AppColors.azulPrincipal),
                                    onTap: () {
                                      if(quinta) {
                                        showDialog(context: context, builder: (builder) {
                                          return DialogSelecaoHora(onHoraSelecionada: (hora) {
                                            setState(() {
                                              horarioQuinta.setHorarioFechamento(hora.format(context));
                                              quintaFechamentoController.text = horarioQuinta.getHorarioFechamento.toString();
                                            });
                                          });
                                        });
                                      }
                                    }
                                ),
                                hintText: "18:00",
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.cinza
                                )
                            ),
                            controller: quintaFechamentoController,
                          ),
                        )],
                    ),
                  )
                ],
              ),
              //Sexta-feira
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      width: 120,
                      child: Row(
                        children: [
                          Checkbox(
                              value: sexta,
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                              onChanged: (valor) {
                                setState(() {
                                  sexta = valor!;
                                });
                              }
                          ),const Texto(texto: "Sexta", tamanhoTexto: 14, peso: FontWeight.w500, cor: AppColors.preto)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        const Texto(texto: "de", tamanhoTexto: 14, peso: FontWeight.w300, cor: AppColors.preto),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            readOnly: true,
                            textAlignVertical: TextAlignVertical.center,
                            onChanged: (valorAbertura) {
                              setState(() {
                                horarioSexta.setHorarioAbertura(valorAbertura);
                              });
                            },
                            enabled: sexta,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                            ),
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                                prefixIcon: GestureDetector(
                                  child: const Icon(Icons.access_time_rounded, size: 24, color: AppColors.azulPrincipal),
                                  onTap: () {
                                    if(sexta) {
                                      showDialog(context: context, builder: (builder) {
                                        return DialogSelecaoHora(onHoraSelecionada: (hora) {
                                          setState(() {
                                            horarioSexta.setHorarioAbertura(hora.format(context));
                                            sextaAberturaController.text = horarioSexta.getHorarioAbertura().toString();
                                          });
                                        });
                                      });
                                    }
                                  },
                                ),
                                hintText: "08:00",
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.cinza
                                )
                            ),
                            controller: sextaAberturaController,
                          ),
                        ),
                        const Texto(texto: "às", tamanhoTexto: 14, peso: FontWeight.w300, cor: AppColors.preto),
                        Expanded(
                          child: TextField(
                            readOnly: true,
                            textAlignVertical: TextAlignVertical.center,
                            onChanged: (valorFechamento) {
                              setState(() {
                                horarioSexta.setHorarioFechamento(valorFechamento);
                              });
                            },
                            enabled: sexta,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                            ),
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                                prefixIcon: GestureDetector(
                                  child: const Icon(Icons.access_time_rounded, size: 24, color: AppColors.azulPrincipal),
                                  onTap: () {
                                    if(sexta) {
                                      showDialog(context: context, builder: (builder) {
                                        return DialogSelecaoHora(onHoraSelecionada: (hora) {
                                          setState(() {
                                            horarioSexta.setHorarioFechamento(hora.format(context));
                                            sextaFechamentoController.text = horarioSexta.getHorarioFechamento().toString();
                                          });
                                        });
                                      });
                                    }
                                  },
                                ),
                                hintText: "18:00",
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.cinza
                                )
                            ),
                            controller: sextaFechamentoController,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              //Sábado
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      width: 120,
                      child: Row(
                          children: [
                            Checkbox(
                                value: sabado,
                                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                                onChanged: (valor) {
                                  setState(() {
                                    sabado = valor!;
                                    if(!sabado) {
                                      horarioSabado.setHorarioAbertura("");
                                      horarioSabado.setHorarioFechamento("");
                                    }
                                  });
                                }
                            ),
                            const Texto(texto: "Sábado", tamanhoTexto: 14, peso: FontWeight.w500, cor: AppColors.preto)
                          ]
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        const Texto(texto: "de", tamanhoTexto: 14, peso: FontWeight.w300, cor: AppColors.preto),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            readOnly: true,
                            textAlignVertical: TextAlignVertical.center,
                            onChanged: (valorAbertura) {
                              setState(() {
                                horarioSabado.setHorarioAbertura(valorAbertura);
                              });
                            },
                            enabled: sabado,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                            ),
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                                prefixIcon: GestureDetector(
                                  child: const Icon(Icons.access_time_rounded, size: 24, color: AppColors.azulPrincipal),
                                  onTap: () {
                                    if(sabado) {
                                      showDialog(context: context, builder: (builder) {
                                        return DialogSelecaoHora(onHoraSelecionada: (hora) {
                                          setState(() {
                                            horarioSabado.setHorarioAbertura(hora.format(context));
                                            sabadoAberturaController.text = horarioSabado.getHorarioAbertura().toString();
                                          });
                                        });
                                      });
                                    }
                                  },
                                ),
                                hintText: "08:00",
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.cinza
                                )
                            ),
                            controller: sabadoAberturaController,
                          ),
                        ),
                        const Texto(texto: "às", tamanhoTexto: 14, peso: FontWeight.w300, cor: AppColors.preto),
                        Expanded(
                          child: TextField(
                            readOnly: true,
                            textAlignVertical: TextAlignVertical.center,
                            onChanged: (valorFechamento) {
                              setState(() {
                                horarioSabado.setHorarioFechamento(valorFechamento);
                              });
                            },
                            enabled: sabado,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                            ),
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                                prefixIcon: GestureDetector(
                                  child: const Icon(Icons.access_time_rounded, size: 24, color: AppColors.azulPrincipal),
                                  onTap: () {
                                    if(sabado) {
                                      showDialog(context: context, builder: (builder) {
                                        return DialogSelecaoHora(onHoraSelecionada: (hora) {
                                          setState(() {
                                            horarioSabado.setHorarioFechamento(hora.format(context));
                                            sabadoFechamentoController.text = horarioSabado.getHorarioFechamento().toString();
                                          });
                                        });
                                      });
                                    }
                                  },
                                ),
                                hintText: "18:00",
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.cinza
                                )
                            ),
                            controller: sabadoFechamentoController,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              //Domingo
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      width: 120,
                      child: Row(
                        children: [
                          Checkbox(
                              value: domingo,
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                              onChanged: (valor) {
                                setState(() {
                                  domingo = valor!;
                                  if(!domingo) {
                                    horarioDomingo.setHorarioAbertura("");
                                    horarioDomingo.setHorarioFechamento("");
                                  }
                                });
                              }
                          ),
                          const Texto(texto: "Domingo", tamanhoTexto: 14, peso: FontWeight.w500, cor: AppColors.preto),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        const Texto(texto: "de", tamanhoTexto: 14, peso: FontWeight.w300, cor: AppColors.preto),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            readOnly: true,
                            textAlignVertical: TextAlignVertical.center,
                            onChanged: (valorAbertura) {
                              setState(() {
                                horarioDomingo.setHorarioAbertura(valorAbertura);
                              });
                            },
                            enabled: domingo,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                            ),
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                                prefixIcon: GestureDetector(
                                  child: const Icon(Icons.access_time_rounded, size: 24, color: AppColors.azulPrincipal),
                                  onTap: () {
                                    if(domingo) {
                                      showDialog(context: context, builder: (builder) {
                                        return DialogSelecaoHora(onHoraSelecionada: (hora) {
                                          setState(() {
                                            horarioDomingo.setHorarioAbertura(hora.format(context));
                                            domingoAberturaController.text = horarioDomingo.getHorarioAbertura().toString();
                                          });
                                        });
                                      });
                                    }
                                  },
                                ),
                                hintText: "08:00",
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.cinza
                                )
                            ),
                            controller: domingoAberturaController,
                          ),
                        ),
                        const Texto(texto: "às", tamanhoTexto: 14, peso: FontWeight.w300, cor: AppColors.preto),
                        Expanded(
                          child: TextField(
                            readOnly: true,
                            textAlignVertical: TextAlignVertical.center,
                            onChanged: (valorFechamento) {
                              setState(() {
                                horarioDomingo.setHorarioFechamento(valorFechamento);
                              });
                            },
                            enabled: domingo,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                            ),
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                                prefixIcon: GestureDetector(
                                  child: const Icon(Icons.access_time_rounded, size: 24, color: AppColors.azulPrincipal),
                                  onTap: () {
                                    if(domingo) {
                                      showDialog(context: context, builder: (builder) {
                                        return DialogSelecaoHora(onHoraSelecionada: (hora) {
                                          setState(() {
                                            horarioDomingo.setHorarioFechamento(hora.format(context));
                                            domingoFechamentoController.text = horarioDomingo.getHorarioFechamento().toString();
                                          });
                                        });
                                      });
                                    }
                                  },
                                ),
                                hintText: "12:00",
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.cinza
                                )
                            ),
                            controller: domingoFechamentoController,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          )
      ),
    );
  }
}
