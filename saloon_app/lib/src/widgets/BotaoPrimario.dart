import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saloon_app/src/utils/AppColors.dart';

class BotaoPrimario extends StatefulWidget {

  final VoidCallback onPressed;
  final String textoBotao;

  const BotaoPrimario(this.onPressed,this.textoBotao,{super.key});

  @override
  State<BotaoPrimario> createState() => _BotaoPrimarioState();
}

class _BotaoPrimarioState extends State<BotaoPrimario> {
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            backgroundColor: const WidgetStatePropertyAll(AppColors.azulPrincipal),
            elevation: const WidgetStatePropertyAll(4)
        ),
        child: Text(widget.textoBotao,
            style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.branco)),
      ),
    );

  }
}
