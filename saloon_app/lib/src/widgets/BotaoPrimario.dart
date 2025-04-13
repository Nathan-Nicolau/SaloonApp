import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saloon_app/src/utils/AppColors.dart';

class BotaoPrimario extends StatefulWidget {

  final VoidCallback onPressed;
  final String textoBotao;
  final bool larguraExtendida;
  final bool habilitado;
  final Icon? icone;

  const BotaoPrimario({required this.onPressed,required this.textoBotao, this.larguraExtendida = false,this.habilitado = true, this.icone = null, super.key});

  @override
  State<BotaoPrimario> createState() => _BotaoPrimarioState();
}

class _BotaoPrimarioState extends State<BotaoPrimario> {
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: widget.larguraExtendida ? double.infinity : null,
      child: ElevatedButton(
        onPressed: widget.habilitado ? widget.onPressed : null,
        style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: AppColors.azulPrincipal, width: 2) )),
            backgroundColor: WidgetStatePropertyAll(widget.habilitado ? AppColors.azulPrincipal : AppColors.branco),
            elevation: WidgetStatePropertyAll(widget.habilitado ? 2 : 0)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.textoBotao,
                style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: widget.habilitado ? AppColors.branco : AppColors.azulPrincipal)),
            widget.icone != null ? widget.icone! : Row()
          ],
        ),
      ),
    );

  }
}
