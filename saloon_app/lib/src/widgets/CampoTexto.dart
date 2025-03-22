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

  CampoTexto(this.valorTexto, this.label, this.placeholder, this.textoAjudaInferior, this.corTexto, this.erro, this.aviso, this.iconeInicial, this.iconeFinal, this.onTextChange, {super.key});

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
          onChanged: widget.onTextChange,
          controller: TextEditingController(
            text: widget.valorTexto
          ),
          decoration: InputDecoration(
              hintText: widget.placeholder,
              hintStyle: GoogleFonts.poppins(
                  fontSize: 14
              )
          ),
        )
      ],
    );
  }

}
