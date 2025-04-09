import 'package:flutter/material.dart';
import 'package:saloon_app/src/model/vo/ServicoVO.dart';
import '../../../../utils/AppColors.dart';
import '../../../CardServicoAdicionado.dart';
import '../../../Texto.dart';
import '../../../dialog/DialogConfirmacao.dart';

class AbaServicosCadastrados extends StatefulWidget {
  
  final List<ServicoVO> listaServicosCadastrados;
  final Function(ServicoVO) removerServico;
  
  const AbaServicosCadastrados({required this.listaServicosCadastrados, required this.removerServico, super.key});

  @override
  State<AbaServicosCadastrados> createState() => _AbaServicosCadastradosState();
}

class _AbaServicosCadastradosState extends State<AbaServicosCadastrados> {

  void showDialogConfirmacao(ServicoVO servicoVo) {
    setState(() {
      showDialog(context: context, builder: (BuildContext context) {
        var descricaoServico = servicoVo.getDescricaoServico();
        return DialogConfirmacao(mensagem: "Deseja mesmo excluir o serviço $descricaoServico ?", onDismiss: (ok) {
          if(ok) {
            widget.listaServicosCadastrados.remove(servicoVo);
            widget.removerServico(servicoVo);
            Navigator.pop(context);
          } else {
            Navigator.pop(context);
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          widget.listaServicosCadastrados.isNotEmpty
              ? Expanded( // Adicionado Expanded aqui para o ListView.builder
            child: ListView.builder(
              controller: ScrollController(),
              itemCount: widget.listaServicosCadastrados.length,
              itemBuilder: (context, index) {
                ServicoVO servico = widget.listaServicosCadastrados[index];
                return CardServicoAdicionado(
                  servicoVO: servico,
                  removerServico: (servico) {
                    showDialogConfirmacao(servico);
                  },
                );
              },
            ),
          )
              : const SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    children: [
                      Texto(
                          texto: "Parece que você ainda não cadastrou nenhum serviço",
                          tamanhoTexto: 16,
                          peso: FontWeight.w600,
                          cor: AppColors.preto),
                      Texto(
                          texto: "Clique no botão voltar e adicione algum serviço",
                          tamanhoTexto: 14,
                          peso: FontWeight.normal,
                          cor: AppColors.preto)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
