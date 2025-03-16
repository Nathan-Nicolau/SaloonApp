import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Icone extends StatefulWidget {

  String nomeIcone;
  double largura;
  double altura;

  Icone(this.nomeIcone, this.largura, this.altura, {super.key});

  @override
  State<Icone> createState() => _IconeState();

}

class _IconeState extends State<Icone> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
        widget.nomeIcone, width: widget.largura, height: widget.altura);
  }
}
