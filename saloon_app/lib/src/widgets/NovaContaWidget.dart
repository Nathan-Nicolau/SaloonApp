import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saloon_app/src/utils/AppColors.dart';
import 'package:saloon_app/src/utils/UtilsUI.dart';
import 'package:saloon_app/src/widgets/BotaoSecundario.dart';

class NovaContaWidget extends StatefulWidget {
  const NovaContaWidget({super.key});

  @override
  State<NovaContaWidget> createState() => _NovaContaWidgetState();
}

class _NovaContaWidgetState extends State<NovaContaWidget> {

  void retornarTela() {
    Navigator.pop(context);
  }

  void navegarTelaAdministrador() {
    Navigator.pushNamed(context, "/paywall");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_rounded, color: AppColors.preto),
          onTap: () {
            retornarTela();
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Nova conta", style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.preto
            ),)
          ],
        ),
      ),
      backgroundColor: AppColors.branco,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Qual seria o seu tipo de conta ?", style:GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.cinzaEscuro
            )),
            Container(
              margin: UtilsUI.padding,
              padding: UtilsUI.padding,
              child: Column(
                spacing: 4,
                children: [
                  BotaoSecundario(() {
                    navegarTelaAdministrador();
                  }, "Sou administrador(a) de salão"),
                  BotaoSecundario(() {

                  }, "Sou um(a) cliente"),
                  BotaoSecundario(() {

                  }, "Sou um(a) profissional")
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
