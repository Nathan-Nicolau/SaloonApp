import 'package:flutter/material.dart';
import 'package:saloon_app/src/enums/PlanosUsoSaloonEnum.dart';
import 'package:saloon_app/src/utils/AppColors.dart';
import 'package:saloon_app/src/widgets/Texto.dart';

class CardEscolhaPlano extends StatefulWidget {

  final PlanoUsoSaloonEnum plano;
  final bool selecionado;
  Function(int) selecionarPlano;

  CardEscolhaPlano({required this.plano,required this.selecionado,required this.selecionarPlano, super.key});

  @override
  State<CardEscolhaPlano> createState() => _CardEscolhaPlanoState();
}

class _CardEscolhaPlanoState extends State<CardEscolhaPlano> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _elevationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(microseconds: 300),
      vsync: this,
    );
    _elevationAnimation = Tween<double>(begin: 1.0, end: 15.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void didUpdateWidget(covariant CardEscolhaPlano oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selecionado != oldWidget.selecionado) {
      if (widget.selecionado) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: _elevationAnimation,
      builder: (c,a) {
        return Card(
          elevation: widget.selecionado ? 2 : 0.2,
          shadowColor: AppColors.preto,
          color: widget.selecionado ? AppColors.branco : AppColors.cinzaLight,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  style: BorderStyle.solid,
                  width: widget.selecionado ? 2 : 1,
                  color: widget.selecionado ? AppColors.azulPrincipal : AppColors.cinzaClaro
              ),
              borderRadius: BorderRadius.circular(12)),
          child: InkWell(
            onTap: () {
              setState(() {
                widget.selecionarPlano(
                    widget.plano.codigo
                );
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                spacing: 8,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 4,
                        children: [
                          Icon(Icons.circle, size: 18,color: widget.plano.corPlano),
                          Texto(texto: widget.plano.nomePlano, tamanhoTexto: 16, peso: FontWeight.w600, cor: AppColors.preto)
                        ],
                      ),
                      Row(children: [
                        widget.plano.recomendado ?
                        const Card(
                          elevation: 0,
                          color: AppColors.azulPrincipal,
                          child: Padding(padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                              child: Texto(texto: "Recomendado", tamanhoTexto: 12, peso: FontWeight.w600, cor: AppColors.branco)),
                        )
                            : const SizedBox()
                      ]
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                        child: Row(
                          spacing: 4,
                          children: [
                            const Icon(Icons.circle, size: 6, color: AppColors.preto),
                            Row(
                              children: [
                                Texto(texto: "Até ", tamanhoTexto: 14, peso: widget.selecionado ? FontWeight.bold : FontWeight.normal, cor: widget.selecionado ? AppColors.azulPrincipal : AppColors.preto),
                                Texto(texto: widget.plano.quantidadeProfissionaisPermitidos.toString(), tamanhoTexto: 14, peso: FontWeight.w600, cor: widget.selecionado ? AppColors.azulPrincipal : AppColors.preto),
                                Texto(texto: " profissionais vinculados", tamanhoTexto: 14, peso: widget.selecionado ? FontWeight.bold : FontWeight.normal, cor: widget.selecionado ? AppColors.azulPrincipal : AppColors.preto),
                              ],
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Texto(texto: "${widget.plano.valor}/mês", tamanhoTexto: 16, peso: widget.selecionado ? FontWeight.bold : FontWeight.w500, cor: widget.selecionado ? AppColors.azulPrincipal : AppColors.preto)
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );

  }

}
