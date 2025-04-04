import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saloon_app/src/utils/UtilsUI.dart';
import 'package:saloon_app/src/widgets/PontoTextoWidget.dart';
import '../utils/AppColors.dart';
import '../utils/app_icons.dart';
import 'BotaoPrimario.dart';
import 'BotaoSecundario.dart';
import 'Icone.dart';

class PaywallWidget extends StatefulWidget {
  const PaywallWidget({super.key});

  @override
  State<PaywallWidget> createState() => _PaywallWidgetState();
}

class _PaywallWidgetState extends State<PaywallWidget> {

  void prosseguirTelaCadastroProprietario() {
    Navigator.pushNamed(context, "/cadastroProprietario");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.tomCinza,
      body: Container(
        color: AppColors.tomCinza,
        width: double.infinity,
        child: Column(
          children: [
            Spacer(flex: 1),
            Icone(AppIcons.imagemPaywall, 200, 200),
            Spacer(flex: 1),
            //Container inferior
            Container(
              width: double.infinity,
              height: 500,
              decoration: const BoxDecoration(
                  color: AppColors.branco,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(64)
                  )
              ),
              child: Padding(padding: const EdgeInsets.all(24), child:
              Column(
                  spacing: 12,
                  children: [
                    Container(
                      padding: UtilsUI.padding,
                      margin: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                      child: Text("Gerenciamento completo de sua agenda",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: AppColors.preto,
                          )
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        spacing: 8,
                        children: [
                          const PontoTextoWidget("Tenha acesso completo ao sistema gratuitamente no período de testes"),
                          const PontoTextoWidget("Sem limitações de notificações para clientes, cadastro de serviços, relatórios ou agendamentos"),
                          const PontoTextoWidget("Plano inicial de apenas RS 29,90 por mês para dois profissionais simultâneos."),
                          const PontoTextoWidget("Cancele a sua assinatura quando quiser. Sem multas ou fidelidade. Você no controle do seu negócio!"),
                          Container(
                            margin: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                            child: Column(
                              children: [
                                BotaoPrimario(onPressed: () {
                                  prosseguirTelaCadastroProprietario();
                                }, textoBotao: "Testar grátis por 15 dias",larguraExtendida: true),
                                BotaoSecundario(onPressed: () {

                                },textoBotao: "Assine já")
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ]
              ),),
            )
          ],
        ),
      ),
    );
  }
}
