import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saloon_app/src/utils/AppColors.dart';

class BotaoPrimario extends StatefulWidget {

  final VoidCallback onPressed;
  final String textoBotao;
  final bool larguraExtendida;
  final Icon? icone;

  const BotaoPrimario({required this.onPressed,required this.textoBotao, this.larguraExtendida = false, this.icone = null, super.key});

  @override
  State<BotaoPrimario> createState() => _BotaoPrimarioState();
}

class _BotaoPrimarioState extends State<BotaoPrimario> {
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: widget.larguraExtendida ? double.infinity : null,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            backgroundColor: const WidgetStatePropertyAll(AppColors.azulPrincipal),
            elevation: const WidgetStatePropertyAll(2)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.textoBotao,
                style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.branco)),
            widget.icone != null ? widget.icone! : Row()
          ],
        ),
      ),
    );

  }
}
