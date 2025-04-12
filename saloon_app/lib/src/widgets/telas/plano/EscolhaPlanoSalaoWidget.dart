import 'package:flutter/material.dart';
import 'package:saloon_app/src/enums/PlanosUsoSaloonEnum.dart';
import 'package:saloon_app/src/widgets/BotaoSecundario.dart';
import 'package:saloon_app/src/widgets/Texto.dart';
import 'package:saloon_app/src/widgets/telas/plano/abas_escolha_plano/AbaEscolhaPlanos.dart';
import 'package:saloon_app/src/widgets/telas/plano/abas_escolha_plano/AbaInformacaoPlanos.dart';
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
  String tituloBotaoAvancar = "Conhecer planos";
  int pagina = 0;
  int textoPagina = 1;

  late PlanoUsoSaloonEnum? planoSelecionado;
  late bool confirmacaoPlanoMensal = false;
  late int diaMesVencimento = 10;
  late bool confirmacaoInicioPlano = false;
  late bool confirmacaoResponsabilidadePagamento = false;

  void selecionarPlano(int codigoPlano) {
    setState(() {
      for(var plano in PlanoUsoSaloonEnum.values) {
        if(plano.codigo == codigoPlano) {
          planoSelecionado = plano;
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    planoSelecionado = PlanoUsoSaloonEnum.PRATA;
  }

  void prosseguirTela() {
    setState(() {
      if(pagina < 5) {
        pagina++;
        textoPagina = pagina + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    //Essa lista irá receber as abas de cadastro
    List<Widget> telas = [
      const AbasInformacaoPlanos(),
      AbaEscolhaPlanos(planoSelecionado: planoSelecionado, selecionarPlano: (codigo) {
        selecionarPlano(codigo);
      })
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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(child: BotaoPrimario(onPressed: prosseguirTela, textoBotao: "Conhecer planos", larguraExtendida: true))
          ],
        ),
      ),
    );
  }
}
