import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saloon_app/src/model/vo/UsuarioVO.dart';
import 'package:saloon_app/src/widgets/BotaoLoading.dart';
import 'package:saloon_app/src/widgets/CampoTexto.dart';

import '../utils/AppColors.dart';
import 'BotaoSecundario.dart';

class Loginwidget extends StatefulWidget {
  const Loginwidget({super.key});

  @override
  State<Loginwidget> createState() => _LoginwidgetState();
}

class _LoginwidgetState extends State<Loginwidget> {

  @override
  Widget build(BuildContext context) {

    bool exibirCarregamento = false;
    String loginUsuarioInformado = "";
    String senhaInformada = "";

    UsuarioVO usuarioVO = UsuarioVO.vazio();

    void setExibirCarregamento() {
      setState(() {
        exibirCarregamento = !exibirCarregamento;
      });
    }

    void setLoginUsuarioInformado(String login) {
      setState(() {
        loginUsuarioInformado = login;
      });
    }

    void setSenhaUsuarioInformada(String senha) {
      setState(() {
        senhaInformada = senha;
      });
    }

    void realizarLogin() async {
      usuarioVO = UsuarioVO.login(loginUsuarioInformado, senhaInformada);
      //realizar o processo de login no Viewmodel aqui
    }

    bool senhaVisivel = true;

    void retornarTela() {
      Navigator.pop(context);
    }

    void setVisibilidadeSenha(bool visivel) {
      setState(() {
        senhaVisivel = visivel;
      });
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
            CampoTexto("","Email", "Digite seu email de acesso", "", AppColors.preto, false, false, null, null, (texto) {

             }),
            CampoTexto("","Senha", "Digite sua senha", "", AppColors.preto, false, false, null, null, (texto) {

            }),
            BotaoLoading(onPressed: () async {
              return Future.delayed(const Duration(seconds: 10)).then((valor) {
                return false;
              });
            }, textoBotao: "Entrar"),
            BotaoSecundario(() {}, "Esqueci minha senha")
          ],
        ),
      ),
    );
  }
}
