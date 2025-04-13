import 'package:flutter/material.dart';
import 'package:saloon_app/src/enums/PlanosUsoSaloonEnum.dart';
import 'package:saloon_app/src/model/vo/PlanoSalaoVO.dart';
import 'package:saloon_app/src/widgets/Texto.dart';
import 'package:saloon_app/src/widgets/cards/CardEscolhaPlano.dart';
import '../../../../utils/AppColors.dart';

class AbaEscolhaPlanos extends StatefulWidget {

  PlanoUsoSaloonEnum? planoSelecionado;
  Function(int) selecionarPlano;

  AbaEscolhaPlanos({required this.planoSelecionado,required this.selecionarPlano, super.key});

  @override
  State<AbaEscolhaPlanos> createState() => _AbaEscolhaPlanosState();
}

class _AbaEscolhaPlanosState extends State<AbaEscolhaPlanos> {

  late List<Widget> planos;
  late PlanoSalaoVO planoSalaoVO;
  late PlanoUsoSaloonEnum? planoSelecionado;

  void setPlanoSelecionado(int codigoPlano) {
    setState(() {
      for(var plano in PlanoUsoSaloonEnum.values) {
        if(plano.codigo == codigoPlano) {
          planoSelecionado = plano;
          widget.selecionarPlano(plano.codigo);
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    planos = [];
    planoSalaoVO = PlanoSalaoVO();
    planoSelecionado = null;
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      child: Padding(padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          const Texto(texto: "Planos do sistema Saloon", tamanhoTexto: 16, peso: FontWeight.w600, cor: AppColors.preto),
          const Texto(texto: "Basta clicar na opção para selecionar", tamanhoTexto: 12, peso: FontWeight.w300, cor: AppColors.preto),
          const SizedBox(height: 8),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        final itemSelecionado = PlanoUsoSaloonEnum.values[index];
                        return CardEscolhaPlano(
                            plano: itemSelecionado,
                            selecionado: planoSelecionado == itemSelecionado,
                            selecionarPlano: (codigo) {
                              setPlanoSelecionado(codigo);
                            }
                        );
                  }),
                )
              ]
            ),
          )
        ],
      )),
    );

  }

}
