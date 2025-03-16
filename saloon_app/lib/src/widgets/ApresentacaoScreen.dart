import 'package:flutter/material.dart';
import 'package:saloon_app/src/utils/AppColors.dart';
import 'package:saloon_app/src/utils/app_icons.dart';
import 'package:saloon_app/src/widgets/Icone.dart';

class ApresentacaoScreen extends StatefulWidget {
  const ApresentacaoScreen({super.key});

  @override
  State<ApresentacaoScreen> createState() => _ApresentacaoScreenState();
}

class _ApresentacaoScreenState extends State<ApresentacaoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.tomCinza,
      body: Column(
        children: [
          Center(
            child:Icone(AppIcons.iconeApresentacao, 200, 200)
          )
        ],
      ),
    );
  }
}
