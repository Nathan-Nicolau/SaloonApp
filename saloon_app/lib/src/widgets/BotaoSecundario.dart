import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/AppColors.dart';

class BotaoSecundario extends StatefulWidget {

   final VoidCallback onPressed;
   final String textoBotao;

  const BotaoSecundario(this.onPressed, this.textoBotao,{super.key});


  @override
  State<BotaoSecundario> createState() => _BotaoSecundarioState();
}

class _BotaoSecundarioState extends State<BotaoSecundario> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            backgroundColor: const WidgetStatePropertyAll(AppColors.branco),
            elevation: const WidgetStatePropertyAll(2)
        ),
        child: Text(widget.textoBotao,
            style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.azulPrincipal)),
      ),
    );
  }
}
