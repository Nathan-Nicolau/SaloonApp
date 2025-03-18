import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saloon_app/src/utils/AppColors.dart';

class PontoTextoWidget extends StatefulWidget {

  final String texto;

  const PontoTextoWidget(this.texto,{super.key});

  @override
  State<PontoTextoWidget> createState() => _PontoTextoWidgetState();
}

class _PontoTextoWidgetState extends State<PontoTextoWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 8,
      children: [
        const Icon(Icons.circle, size: 8, color: AppColors.azulPrincipal),
        Expanded(child: Text(widget.texto,style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: AppColors.cinzaEscuro
        )))
      ],
    );
  }
}
