import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../enums/CategoriaServicoEnum.dart';
import '../model/vo/ServicoVO.dart';
import '../utils/AppColors.dart';
import 'BotaoPrimario.dart';
import 'CampoTexto.dart';

class ContainerServicoAdicionado extends StatefulWidget {

  CategoriaServicoEnum categoriaServico;
  Function(ServicoVO) onRegister;

  ContainerServicoAdicionado({required this.categoriaServico, required this.onRegister, super.key});

  @override
  State<ContainerServicoAdicionado> createState() => _ContainerServicoAdicionadoState();
}

class _ContainerServicoAdicionadoState extends State<ContainerServicoAdicionado> {

  late ServicoVO servicoAdicionado;

  @override
  void initState() {
    super.initState();
    servicoAdicionado = ServicoVO();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
      child: Column(
        spacing: 4,
        children: [
          //Nome de cadastro do usuário proprietário
          CampoTexto(iconeInicial: Icon(Icons.short_text_rounded, size: 16,color: AppColors.azulPrincipal),valorTexto: "", label: "Nome do Serviço", placeholder: "Informe o nome ou descrição", textoAjudaInferior: "", corTexto: AppColors.preto, erro: false, aviso: false, iconeFinal: null, onTextChange: (valorTexto) {
            servicoAdicionado.setDescricaoServico(valorTexto);
          }),
          CampoTexto(iconeInicial: const Icon(Icons.attach_money_rounded,size: 16,color: AppColors.azulPrincipal),valorTexto: "", label: "Valor do Serviço", placeholder: "RS",textoAjudaInferior: "", corTexto: AppColors.preto,erro: false, aviso: false, iconeFinal: null,onTextChange: (valorTexto) {
            servicoAdicionado.setValor(double.tryParse(valorTexto) ?? 0);
          }),
          CampoTexto(iconeInicial: const Icon(Icons.access_time_rounded, size: 16, color: AppColors.azulPrincipal),valorTexto: "", label: "Tempo de duração", placeholder: "Exemplo: 1 hora",textoAjudaInferior: "", corTexto: AppColors.preto,erro: false, aviso: false, iconeFinal: null,onTextChange: (valorTexto) {
            servicoAdicionado.setTempoDuracao(valorTexto);
          }),
          const Row(),
          Row(
            spacing: 4,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BotaoPrimario(onPressed: () {
                servicoAdicionado.setCategoraServicoEnum(widget.categoriaServico);
                widget.onRegister(servicoAdicionado);
              }, textoBotao: "Adicionar serviço",icone: const Icon(Icons.add_rounded, color: AppColors.branco, size: 16,weight: 100))
            ],
          )
        ],
      ),
    );
  }
}