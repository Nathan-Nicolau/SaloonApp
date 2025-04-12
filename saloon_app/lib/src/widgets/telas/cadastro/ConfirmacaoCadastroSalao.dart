import 'package:flutter/material.dart';
import 'package:saloon_app/src/model/vo/SalaoVO.dart';
import 'package:saloon_app/src/utils/AppColors.dart';
import 'package:saloon_app/src/widgets/Texto.dart';

class ConfirmacaoCadastroSalao extends StatefulWidget {

  final SalaoVO salaoVO;
  const ConfirmacaoCadastroSalao({required this.salaoVO, super.key});

  @override
  State<ConfirmacaoCadastroSalao> createState() => _AbaConfirmacaoCadastroState();
}

class _AbaConfirmacaoCadastroState extends State<ConfirmacaoCadastroSalao> {

  late List<Widget> listaWidgetsHorarios;

  @override
  void initState() {
    super.initState();
    listaWidgetsHorarios = [];
    widget.salaoVO.horarioFuncionamentoCompletoVO?.getHorariosEmLista().forEach((horario) {
      listaWidgetsHorarios.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 4,
          children: [
            Texto(texto: "${horario?.diaSemanaEnum?.descricao.toString()}", tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto),
            Row(
              spacing: 4,
              children: [
                const Texto(texto: "das", tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto),
                Texto(texto: horario?.getHorarioAbertura() ?? "Não informado", tamanhoTexto: 14, peso: FontWeight.w700, cor: AppColors.azulPrincipal)
              ],
            ),
            Row(
              spacing: 4,
              children: [
                const Texto(texto: "às", tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto),
                Texto(texto: horario?.getHorarioFechamento() ?? "Não informado", tamanhoTexto: 14, peso: FontWeight.w700, cor: AppColors.azulPrincipal),
              ],
            )
          ],
        )
    );});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.branco,
        title: const Texto(texto: "Confirmação de cadastro", tamanhoTexto: 18, peso: FontWeight.bold, cor: AppColors.preto),
      ),
      backgroundColor: AppColors.branco,
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Texto(texto: "Abaixo os principais dados informados,que estarão visíveis para seus clientes", tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto),
              const Texto(texto: "Não se preocupe, você pode editar todos os valores posteriormente", tamanhoTexto: 12, peso: FontWeight.w300, cor: AppColors.preto),
              const SizedBox(height: 24),
              Card(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                elevation: 2,
                color: AppColors.cinzaClaro,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SizedBox(
                    child: Column(
                      spacing: 4,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            spacing: 4,
                            children: [
                              const Icon(Icons.storefront_outlined,size: 24,color: AppColors.azulPrincipal),
                              Texto(texto: "${widget.salaoVO.getNomeSalao()}", tamanhoTexto: 16, peso: FontWeight.w700, cor: AppColors.preto)
                            ]
                        ),
                        Row(
                          spacing: 4,
                          children: [
                            const Texto(texto: "endereço:", tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto),
                            Texto(texto: widget.salaoVO.getEnderecoSalao() ?? "Não informado", tamanhoTexto: 14, peso: FontWeight.w500, cor: AppColors.azulPrincipal)
                          ],
                        ),
                        Row(
                          spacing: 4,
                          children: [
                            const Texto(texto: "número:", tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto),
                            Texto(texto: "${widget.salaoVO.getNumeroEndereco()}", tamanhoTexto: 14, peso: FontWeight.w500, cor: AppColors.azulPrincipal),
                            const Texto(texto: " CEP:", tamanhoTexto: 14, peso: FontWeight.w500, cor: AppColors.preto),
                            Texto(texto: "${widget.salaoVO.getCepSalao()}", tamanhoTexto: 14, peso: FontWeight.w500, cor: AppColors.azulPrincipal),
                          ],
                        ),
                        Padding(padding: const EdgeInsets.fromLTRB(0, 12, 0, 4), child:
                        SizedBox(
                          width: double.infinity,
                          height: 1,
                          child: SizedBox(child: Container(color: AppColors.cinza)),
                        )),
                        const Row(
                          children: [
                            Texto(texto: "Horário de funcionamento", tamanhoTexto: 16, peso: FontWeight.w600, cor: AppColors.preto),
                          ]
                        ),
                        Column(
                          children:
                          listaWidgetsHorarios
                          ,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
