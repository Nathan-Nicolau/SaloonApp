import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/AppColors.dart';
import 'BotaoPrimario.dart';
import 'BotaoSecundario.dart';

class Loginwidget extends StatefulWidget {
  const Loginwidget({super.key});

  @override
  State<Loginwidget> createState() => _LoginwidgetState();
}

class _LoginwidgetState extends State<Loginwidget> {

  @override
  Widget build(BuildContext context) {

     bool senhaVisivel = true;

    void retornarTela() {
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Login", style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold
            ))
          ],
        ),
        backgroundColor: AppColors.branco,
        leading: GestureDetector(
          onTap: () {
            retornarTela();
          },
          child: const Icon(Icons.arrow_back),
        ),
        actions: [
          Text("                   ")
        ],
      ),
      body: Container(
        color: AppColors.branco,
        padding: EdgeInsets.all(24),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("E-mail", style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.preto
            ),),
            TextField(
              decoration: InputDecoration(
                  hintText: "Digite seu e-mail"
              ),
            ),
            Text("Senha", style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.preto
            ),),
            TextField(
              obscureText: senhaVisivel,
              decoration: InputDecoration(
                  hintText: "Digite sua senha de acesso",
                  suffixIcon: IconButton(onPressed: () {
                    setState(() {
                        if(senhaVisivel) {
                          senhaVisivel = false;
                        } else {
                          senhaVisivel = true;
                        }
                    });
                  }, icon: Icon(senhaVisivel ? Icons.visibility_off_outlined : Icons.visibility_outlined))
              ),
            ),
            BotaoPrimario(() {}, "Entrar"),
            BotaoSecundario(() {}, "Esqueci minha senha")
          ],
        ),
      ),
    );
  }
}
