import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saloon_app/src/utils/AppColors.dart';

class CampoTexto extends StatefulWidget {

  final String label;
  final String placeholder;
  final String textoAjudaInferior;
  final Color corTexto;
  final bool erro;
  final bool aviso;
  final Icon? iconeInicial;
  final Icon? iconeFinal;
  final Function(String valor) onTextChange;

  const CampoTexto(this.label, this.placeholder, this.textoAjudaInferior,this.corTexto, this.erro, this.aviso, this.iconeInicial, this.iconeFinal, this.onTextChange, {super.key});

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {

  @override
  Widget build(BuildContext context) {
    return Expanded(child:
    Column(
      children: [
        Text(widget.label, style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: widget.corTexto
        )),
        TextField(
          decoration: InputDecoration(
              hintText: widget.placeholder,
              hintStyle: GoogleFonts.poppins(
                  fontSize: 14
              )
          ),
        )
      ],
    ));
  }

}
