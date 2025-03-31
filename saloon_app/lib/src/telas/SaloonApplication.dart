
import 'package:flutter/material.dart';
import 'package:saloon_app/src/telas/AgendamentoScreen.dart';
import 'package:saloon_app/src/telas/CadastroSalaoScreen.dart';
import 'package:saloon_app/src/telas/LoginScreen.dart';
import 'package:saloon_app/src/telas/OnboardingScreen.dart';
import 'package:saloon_app/src/telas/PaywallScreen.dart';
import 'package:saloon_app/src/telas/SplashScreen.dart';
import 'package:saloon_app/src/utils/AppColors.dart';
import 'package:saloon_app/src/telas/NovaContaScreen.dart';
import 'package:saloon_app/src/widgets/SplashWidget.dart';
import 'package:saloon_app/src/widgets/telas/AgendamentoWidget.dart';

class SaloonApplication extends StatelessWidget {
  const SaloonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.azulPrincipal),
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/" : (context) => const SplashScreen(),
        "/apresentacao": (context) => const OnboardingScreen(),
        "/login": (context) => const LoginScreen(),
        "/novaConta": (context) => const NovaContaScreen(),
        "/paywall": (context) => const Paywallscreen(),
        "/agendamento-rapido": (context) => const AgendamentoScreen(),
        "/cadastroProprietario": (context) => const CadastroSalaoScreen()
      },
    );
  }
}
