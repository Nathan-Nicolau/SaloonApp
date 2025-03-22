import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saloon_app/src/utils/AppColors.dart';

class AppBarSaloon extends StatefulWidget {

  final Widget? iconeRetorno;
  final String titulo;
  final List<Widget>? icones;

  const AppBarSaloon(this.iconeRetorno ,this.icones,{required this.titulo, super.key});

  @override
  State<AppBarSaloon> createState() => _AppBarSaloonState();

}

class _AppBarSaloonState extends State<AppBarSaloon> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.branco,
      leading: widget.iconeRetorno,
      title: Center(
        child: Text(widget.titulo, style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600
        )),
      ),
      actions: widget.icones,
    );
  }
}
