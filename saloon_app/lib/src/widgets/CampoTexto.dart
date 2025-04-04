import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CampoTexto extends StatefulWidget {

  String valorTexto;
  String label;
  String placeholder;
  String textoAjudaInferior;
  Color corTexto;
  bool erro;
  bool aviso;
  Icon? iconeInicial;
  Icon? iconeFinal;
  Function(String valor) onTextChange;

  CampoTexto({required this.valorTexto, required this.label, required this.placeholder, required this.textoAjudaInferior, required this.corTexto, required this.erro, required this.aviso, required this.iconeInicial, required this.iconeFinal, required this.onTextChange, super.key});

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: widget.corTexto
        )),
        TextField(
          textAlign: TextAlign.start,
          onChanged: widget.onTextChange,
          controller: TextEditingController(
            text: widget.valorTexto
          ),
          decoration: InputDecoration(
              icon: widget.iconeInicial,
              hintText: widget.placeholder,
              hintTextDirection: TextDirection.ltr,
              hintStyle: GoogleFonts.poppins(
                  fontSize: 14
              )
          ),
        )
      ],
    );
  }

}
