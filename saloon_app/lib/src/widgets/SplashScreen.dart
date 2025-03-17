import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:saloon_app/src/utils/AppColors.dart';
import 'package:saloon_app/src/utils/app_icons.dart';
import 'package:saloon_app/src/widgets/Icone.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool exibirCarregamento = true;

  void entrarAplicacao() {
    Navigator.pushNamed(context, "/apresentacao");
  }

  void funcaoExibirCarregamento() async {
    await Future.delayed(const Duration(seconds: 3),() {
      setState(() {
        exibirCarregamento = false;
      });
    }).then((value) => {
      Future.delayed(const Duration(seconds: 2), () {
        entrarAplicacao();
      })
    });
  }

  @override
  void initState() {
    super.initState();
    funcaoExibirCarregamento();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.azulPrincipal,
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icone(AppIcons.iconeLogoInicial, 128, 128),
              Container(
                height: 32,
                width: 32,
                child: const CircularProgressIndicator(
                  strokeWidth: 1,
                  color: AppColors.branco,
                ).animate().fade(duration: const Duration(seconds: 2)),
              )
            ],
          )
        )
      ),
    );
  }
}
