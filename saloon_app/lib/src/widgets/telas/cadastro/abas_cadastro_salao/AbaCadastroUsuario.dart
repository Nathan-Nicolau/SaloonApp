import 'package:flutter/material.dart';
import 'package:saloon_app/src/model/vo/UsuarioVO.dart';
import '../../../../utils/AppColors.dart';
import '../../../CampoTexto.dart';

class AbaCadastroUsuario extends StatefulWidget {

  final UsuarioVO usuario;
  Function(String) setNomeUsuario;
  Function(String) setEmailUsuario;
  Function(String) setTelefoneUsuario;
  Function(String) setSenhaUsuario;
  Function(String) setConfirmacaoSenha;

  AbaCadastroUsuario({required this.setNomeUsuario,required this.setEmailUsuario, required this.setTelefoneUsuario, required this.setSenhaUsuario, required this.setConfirmacaoSenha, super.key, required this.usuario});

  @override
  State<AbaCadastroUsuario> createState() => _AbaCadastroUsuarioState();
}

class _AbaCadastroUsuarioState extends State<AbaCadastroUsuario> {

  bool erroConfirmacaoSenha = false;

  void setErroConfirmacaoSenha() {
    setState(() {
      bool senhaInformada = widget.usuario.getSenhausuario() != null;
      bool confirmacaoSenhaInformada = widget.usuario.getConfirmacaoSenha() != null;
      erroConfirmacaoSenha = (
          widget.usuario.getSenhausuario() != widget.usuario.getConfirmacaoSenha() &&
              senhaInformada && confirmacaoSenhaInformada);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
        child: Column(
            spacing: 8,
            children: [
              //Nome de cadastro do usuário proprietário
              CampoTexto(valorTexto: widget.usuario.getNomeUsuario() ?? "", label: "Nome do(a) proprietário", placeholder: "Será seu nome de usuário", textoAjudaInferior: "", corTexto: AppColors.preto, erro: false, aviso: false, iconeInicial: null, iconeFinal: null, onTextChange: (valorTexto) {
                setState(() {
                  widget.setNomeUsuario(valorTexto);
                });
              }),
              CampoTexto(valorTexto: widget.usuario.getEmailUsuario() ?? "", label: "E-mail", placeholder: "Digite seu e-mail de acesso", textoAjudaInferior: "", corTexto: AppColors.preto, erro: false, aviso: false, iconeInicial: null, iconeFinal: null, onTextChange: (valorTexto) {
                setState(() {
                  widget.setEmailUsuario(valorTexto);
                });
              }),
              CampoTexto(valorTexto: widget.usuario.getTelefoneUsuario() ?? "", label: "Telefone", placeholder: "Digite seu número de telefone", textoAjudaInferior: "", corTexto: AppColors.preto, erro: false, aviso: false, iconeInicial: null, iconeFinal: null, onTextChange: (valorTexto) {
                setState(() {
                  widget.setTelefoneUsuario(valorTexto);
                });
              }),
              SizedBox(height: 12),
              CampoTexto(iconeInicial: const Icon(Icons.key_rounded, size: 16, color: AppColors.azulPrincipal), valorTexto: widget.usuario.getSenhausuario() ?? "", label: "Senha", placeholder: "Mínimo de 8 caracteres", textoAjudaInferior: "", corTexto: AppColors.preto, erro: false, aviso: false, iconeFinal: null, onTextChange: (valorTexto) {
                setState(() {
                  widget.setSenhaUsuario(valorTexto);
                  setErroConfirmacaoSenha();
                });
              }),
              CampoTexto(iconeInicial: Icon(Icons.key_rounded, size: 16, color: erroConfirmacaoSenha ? AppColors.vermelho : AppColors.azulPrincipal), valorTexto: widget.usuario.getConfirmacaoSenha() ?? "", label: "Confirmacao de Senha", placeholder: "********", textoAjudaInferior: "", corTexto: AppColors.preto, erro: erroConfirmacaoSenha, aviso: false, iconeFinal: null, onTextChange: (valorTexto) {
                setState(() {
                  widget.setConfirmacaoSenha(valorTexto);
                  setErroConfirmacaoSenha();
                });
              }),
            ]
        )
    );
  }
}
