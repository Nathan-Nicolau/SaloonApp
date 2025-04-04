import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/vo/ServicoVO.dart';
import '../utils/AppColors.dart';
import 'Texto.dart';

class CardServicoAdicionado extends StatefulWidget {

  ServicoVO servicoVO;
  Function(ServicoVO) removerServico;

  CardServicoAdicionado({required this.servicoVO, required this.removerServico, super.key});

  @override
  State<CardServicoAdicionado> createState() => _CardServicoAdicionadoState();
}

class _CardServicoAdicionadoState extends State<CardServicoAdicionado> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
      child: Expanded(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: AppColors.branco,
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 1,
                      children: [
                        const Texto(texto: "Nome do serviço", tamanhoTexto: 12, peso: FontWeight.w300, cor: AppColors.cinzaEscuro),
                        Texto(texto: widget.servicoVO.descricaoServico ?? "Não informado", tamanhoTexto: 16, peso: FontWeight.bold, cor: AppColors.azulPrincipal),
                        const Texto(texto: "Categoria", tamanhoTexto: 12, peso: FontWeight.w300, cor: AppColors.cinzaEscuro),
                        Texto(texto: widget.servicoVO.getCategoriaServicoEnum()?.descricao ?? "", tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.azulPrincipal),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            widget.removerServico(widget.servicoVO);
                          },
                          child: const Padding(padding: EdgeInsets.all(8),
                              child: Icon(Icons.delete_outline_rounded, color: AppColors.vermelhoDark,size: 24)),
                        )
                      ],)
                  ],
                ),
                Row(
                  spacing: 12,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 1,
                      children: [
                        const Texto(texto: "Tempo de duração", tamanhoTexto: 12, peso: FontWeight.w300, cor: AppColors.cinzaEscuro),
                        Texto(texto: widget.servicoVO.tempoDuracao ?? "Não informado", tamanhoTexto: 14, peso: FontWeight.bold, cor: AppColors.preto)
                      ],
                    ),Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 1,
                      children: [
                        const Texto(texto: "Valor", tamanhoTexto: 12, peso: FontWeight.w300, cor: AppColors.cinzaEscuro),
                        Texto(texto: "RS " + widget.servicoVO.valor.toString(), tamanhoTexto: 14, peso: FontWeight.w500, cor: AppColors.preto)
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}