import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saloon_app/src/utils/AppColors.dart';

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

  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.valorTexto);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: widget.erro ? AppColors.vermelho : widget.corTexto
        )),
        TextField(
          keyboardType: TextInputType.visiblePassword,
          cursorErrorColor: AppColors.vermelho,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          onChanged: widget.onTextChange,
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: widget.erro ? FontWeight.w700 : FontWeight.w500,
            color: widget.erro ? AppColors.vermelho : widget.corTexto
          ),
          controller: controller,
          decoration: InputDecoration(
            fillColor: widget.erro ? AppColors.vermelho : widget.corTexto,
              focusColor: widget.erro ? AppColors.vermelho : widget.corTexto,
              prefixIcon: widget.iconeInicial,
              prefixIconColor: widget.erro ? AppColors.vermelho : widget.corTexto,
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
