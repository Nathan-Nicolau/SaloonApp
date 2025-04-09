import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saloon_app/src/model/vo/CategoriaServicoVO.dart';
import 'package:saloon_app/src/model/vo/ServicoVO.dart';
import '../../../../enums/CategoriaServicoEnum.dart';
import '../../../../utils/AppColors.dart';
import '../../../ContainerServicoAdicionado.dart';
import '../../../Texto.dart';

class AbasCadastroServicos extends StatefulWidget {

  List<CategoriaServicoVO> listaCategoriasSelecionadas;
  bool cabeloMasculino;
  bool cabeloFeminino;
  bool depilacao;
  bool manicure;
  bool maquiagem;
  bool outros;
  Function(ServicoVO) cadastrarNovoServico;

  AbasCadastroServicos({
    required this.listaCategoriasSelecionadas,
    required this.cabeloMasculino,
    required this.cabeloFeminino,
    required this.depilacao,
    required this.manicure,
    required this.maquiagem,
    required this.outros,
    required this.cadastrarNovoServico,
    super.key
  });


  @override
  State<AbasCadastroServicos> createState() => _AbasCadastroServicosState();
}

class _AbasCadastroServicosState extends State<AbasCadastroServicos> with TickerProviderStateMixin {

  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        child: DefaultTabController(length: widget.listaCategoriasSelecionadas.length,
            child: Column(
              children: [
                TabBar(
                    controller: tabController,
                    isScrollable: true,
                    tabs: const [
                      SizedBox(height: 30, child: Texto(texto: "Cabelo masculino", tamanhoTexto: 14, peso: FontWeight.w400, cor: AppColors.azulPrincipal)),
                      SizedBox(height: 30, child: Texto(texto: "Cabelo feminino", tamanhoTexto: 14, peso: FontWeight.w400, cor: AppColors.azulPrincipal)),
                      SizedBox(height: 30, child: Texto(texto: "Depilação", tamanhoTexto: 14, peso: FontWeight.w400, cor: AppColors.azulPrincipal)),
                      SizedBox(height: 30, child: Texto(texto: "Manicure", tamanhoTexto: 14, peso: FontWeight.w400, cor: AppColors.azulPrincipal)),
                      SizedBox(height: 30, child: Texto(texto: "Maquiagem", tamanhoTexto: 14, peso: FontWeight.w400, cor: AppColors.azulPrincipal)),
                      SizedBox(height: 30, child: Texto(texto: "Outros", tamanhoTexto: 14, peso: FontWeight.w400, cor: AppColors.azulPrincipal))
                    ]
                ),
                Expanded(
                  child: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        return SizedBox(
                          height: constraints.maxHeight,
                          child: TabBarView(
                              controller: tabController,
                              children: [
                                widget.cabeloMasculino ?
                                Column(
                                  children: [
                                    ContainerServicoAdicionado(categoriaServico: CategoriaServicoEnum.CABELO_MASCULINO, onRegister: (novoServico) {
                                      widget.cadastrarNovoServico(novoServico);
                                    }),
                                  ],
                                ) : const InfoCategoriaDesabilitada(),
                                widget.cabeloFeminino ?
                                ContainerServicoAdicionado(categoriaServico: CategoriaServicoEnum.CABELO_FEMININO, onRegister: (novoServico) {
                                  widget.cadastrarNovoServico(novoServico);
                                }) : const InfoCategoriaDesabilitada(),
                                widget.depilacao ?
                                ContainerServicoAdicionado(categoriaServico: CategoriaServicoEnum.DEPILACAO, onRegister: (novoServico) {
                                  widget.cadastrarNovoServico(novoServico);
                                }) : const InfoCategoriaDesabilitada(),
                                widget.manicure ?
                                ContainerServicoAdicionado(categoriaServico: CategoriaServicoEnum.MANICURE, onRegister: (novoServico) {
                                  widget.cadastrarNovoServico(novoServico);
                                }) : const InfoCategoriaDesabilitada(),
                                widget.maquiagem ?
                                ContainerServicoAdicionado(categoriaServico: CategoriaServicoEnum.MAQUIAGEM, onRegister: (novoServico) {
                                  widget.cadastrarNovoServico(novoServico);
                                }) : const  InfoCategoriaDesabilitada(),
                                widget.outros ?
                                ContainerServicoAdicionado(categoriaServico: CategoriaServicoEnum.OUTROS, onRegister: (novoServico) {
                                  widget.cadastrarNovoServico(novoServico);
                                }) : const InfoCategoriaDesabilitada()
                              ]
                          ),
                        );
                      }
                  ),
                ),
              ],
            )
        )
    );
  }

}

class InfoCategoriaDesabilitada extends StatelessWidget {
  const InfoCategoriaDesabilitada({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Padding(padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Text("Essa categoria não foi selecionada\npara que serviços possam ser adicionados a ela",
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.normal), textAlign: TextAlign.center)
            ],
          ),),
      ),
    );
  }
}
