import 'package:flutter/material.dart';
import 'package:saloon_app/src/telas/Apresentacao.dart';
import 'package:saloon_app/src/telas/SaloonApplication.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/" : (context) => const SaloonApplication(),
          "/apresentacao": (context) => const Apresentacao()
        },
    )
  );
}
