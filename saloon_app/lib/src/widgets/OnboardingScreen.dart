import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saloon_app/src/utils/AppColors.dart';
import 'package:saloon_app/src/utils/app_icons.dart';
import 'package:saloon_app/src/widgets/BotaoPrimario.dart';
import 'package:saloon_app/src/widgets/BotaoSecundario.dart';
import 'package:saloon_app/src/widgets/Icone.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  void prosseguirTelaLogin() {
    Navigator.pushNamed(context, "/login");
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
            Icone(AppIcons.iconeApresentacao, 200, 200),
            Spacer(flex: 1),
            //Container inferior
            Container(
              width: double.infinity,
              height: 320,
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
                    margin: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                    child: Text("Gerenciamento de agenda\n para salões e barbearias",
                        style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: AppColors.preto
                        )
                    ),
                  ),
                  Text("Controle seus agendamentos com mais facilidade. Receba notificações sobre a agenda em tempo real.",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.cinza
                      ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      spacing: 8,
                      children: [
                        BotaoPrimario(() {}, "Criar nova conta"),
                        BotaoSecundario(() {
                          prosseguirTelaLogin();
                        },"Já tenho conta")
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
