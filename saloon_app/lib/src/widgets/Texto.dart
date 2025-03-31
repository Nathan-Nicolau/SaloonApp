import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Texto extends StatelessWidget {

  final String texto;
  final double tamanhoTexto;
  final FontWeight peso;
  final Color cor;

  const Texto({required this.texto, required this.tamanhoTexto, required this.peso, required this.cor, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(texto, style: GoogleFonts.poppins(
      fontSize: tamanhoTexto,
      fontWeight: peso
    ));
  }
}
