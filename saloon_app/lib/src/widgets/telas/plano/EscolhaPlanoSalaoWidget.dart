import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:saloon_app/src/enums/PlanosUsoSaloonEnum.dart';
import 'package:saloon_app/src/widgets/BotaoSecundario.dart';
import 'package:saloon_app/src/widgets/Texto.dart';
import 'package:saloon_app/src/widgets/telas/plano/abas_escolha_plano/AbaEscolhaDiaVencimento.dart';
import 'package:saloon_app/src/widgets/telas/plano/abas_escolha_plano/AbaEscolhaPlanos.dart';
import 'package:saloon_app/src/widgets/telas/plano/abas_escolha_plano/AbaInformacaoPlanos.dart';
import 'package:saloon_app/src/widgets/telas/plano/abas_escolha_plano/AbaPagamentoMensal.dart';
import '../../../utils/AppColors.dart';
import '../../../utils/UtilsUI.dart';
import '../../BotaoPrimario.dart';

class EscolhaPlanoSalaoWidget extends StatefulWidget {
  const EscolhaPlanoSalaoWidget({super.key});

  @override
  State<EscolhaPlanoSalaoWidget> createState() => _EscolhaPlanoSalaoWidgetState();
}

class _EscolhaPlanoSalaoWidgetState extends State<EscolhaPlanoSalaoWidget> {

  String tituloAppBar = "Acesso";
  String textoBotaoAvancar = "Conhecer planos";
  bool botaoAvancarHabilitado = true;
  int pagina = 0;
  int textoPagina = 1;

  late PlanoUsoSaloonEnum? planoSelecionado;
  late bool confirmacaoPlanoMensal = false;
  late int? diaMesVencimento = null;
  late bool confirmacaoInicioPlano = false;
  late bool confirmacaoResponsabilidadePagamento = false;

  void selecionarPlano(int? codigoPlano) {
    setState(() {
      if(codigoPlano == null) {
        planoSelecionado = null;
      } else {
        for(var plano in PlanoUsoSaloonEnum.values) {
          if(plano.codigo == codigoPlano) {
            planoSelecionado = plano;
            print("Esse foi o plano selecionado: ${plano.nomePlano}");
            ajustarTextoBotaoAvancar();
          }
        }
      }
    });
  }

  void setConfirmacaoPlanoMensal(bool valor) {
    setState(() {
      confirmacaoPlanoMensal = valor;
      ajustarTextoBotaoAvancar();
    });
  }

  void setDiaVencimento(int dia) {
    setState(() {
      diaMesVencimento = dia;
    });
    ajustarTextoBotaoAvancar();
  }

  @override
  void initState() {
    super.initState();
    planoSelecionado = null;
  }

  void retrocederTela() {
    setState(() {
      if(pagina > 0) {

        if(pagina == 1) {
          selecionarPlano(null);
        }

        pagina--;
        textoPagina = pagina;
        ajustarTextoBotaoAvancar();
      }
    });
  }

  void prosseguirTela() {
    setState(() {
      if(pagina < 5) {
        pagina++;
        textoPagina = pagina + 1;
        ajustarTextoBotaoAvancar();
      }
    });
  }

  void ajustarTextoBotaoAvancar() {
    setState(() {
      if(pagina == 0) {
        textoBotaoAvancar = "Conhecer planos";
        botaoAvancarHabilitado = true;
      }
      else if(pagina == 1) {
        textoBotaoAvancar = planoSelecionado != null ? "Avançar" : "Selecione um plano";
        botaoAvancarHabilitado = planoSelecionado != null;
      }
      else if(pagina == 2) {
        textoBotaoAvancar = confirmacaoPlanoMensal ? "Avançar" : "Confirme para avançar";
        botaoAvancarHabilitado = confirmacaoPlanoMensal;
      }
      else if(pagina == 3) {
        textoBotaoAvancar = diaMesVencimento != null ? "Avançar" : "Informe um dia";
        botaoAvancarHabilitado = diaMesVencimento != null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    //Essa lista irá receber as abas de cadastro
    List<Widget> telas = [
      const AbasInformacaoPlanos(),
      AbaEscolhaPlanos(planoSelecionado: planoSelecionado, selecionarPlano: selecionarPlano),
      AbaPagamentoMensal(confirmacaoEstouCiente: confirmacaoPlanoMensal, setEstouCiente: setConfirmacaoPlanoMensal),
      AbaEscolhaDiaVencimento(planoSelecionado: planoSelecionado,diaVencimentoEscolhido: diaMesVencimento,setDiaVencimentoEscolhido: setDiaVencimento)
    ];

    return Scaffold(
      backgroundColor: AppColors.branco,
      appBar: AppBar(
        title: Texto(texto: tituloAppBar, tamanhoTexto: 18, peso: FontWeight.bold, cor: AppColors.preto),
        backgroundColor: AppColors.branco,
        actions: [
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
              child: Texto(texto: "$textoPagina/5 ", tamanhoTexto: 16, peso: FontWeight.w600, cor: AppColors.preto)
          )
        ],
      ),
      body: IndexedStack(
        index: pagina,
        children: telas,
      ),
      bottomNavigationBar: Padding(
        padding: UtilsUI.padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(child: pagina > 0 ? BotaoPrimario(onPressed: retrocederTela, textoBotao: "Voltar") : SizedBox()),
            SizedBox(child: BotaoPrimario(onPressed: prosseguirTela, textoBotao: textoBotaoAvancar, habilitado: botaoAvancarHabilitado))
          ],
        ),
      ),
    );
  }
}
