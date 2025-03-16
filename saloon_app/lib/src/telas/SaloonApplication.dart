
import 'package:flutter/material.dart';
import 'package:saloon_app/src/telas/Onboarding.dart';
import 'package:saloon_app/src/telas/Splash.dart';
import 'package:saloon_app/src/utils/AppColors.dart';
import 'package:saloon_app/src/widgets/SplashScreen.dart';

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
        "/" : (context) => const Splash(),
        "/apresentacao": (context) => const Onboarding()
      },
    );
  }
}
