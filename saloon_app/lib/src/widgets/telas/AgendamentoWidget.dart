import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saloon_app/src/utils/AppColors.dart';

class AgendamentoWidget extends StatefulWidget {
  const AgendamentoWidget({super.key});

  @override
  State<AgendamentoWidget> createState() => _AgendamentoWidgetState();
}

class _AgendamentoWidgetState extends State<AgendamentoWidget> {

  final PageController _controller = PageController();
  int currentIndex = 0;

  void nextPage() {
    if (currentIndex < 4) {
      _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void previousPage() {
    if (currentIndex > 0) {
      _controller.previousPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fluxo com PageView")),
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: [
          Center(child: Text("Tela 1")),
          Center(child: Text("Tela 2")),
          Center(child: Text("Tela 3")),
          Center(child: Text("Tela 4")),
          Center(child: Text("Tela 5 - Final")),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: currentIndex > 0 ? previousPage : null,
              child: Text("Voltar", style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: currentIndex > 0 ? AppColors.branco : AppColors.azulPrincipal
              )),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(currentIndex > 0 ? AppColors.azulPrincipal: AppColors.tomCinza),
                  elevation: WidgetStatePropertyAll(2),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))))
                ),
            ),
            ElevatedButton(
              onPressed: currentIndex < 4 ? nextPage : null,
              child: Text("Avançar", style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: currentIndex < 4 ? AppColors.branco : AppColors.azulPrincipal
              )),
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(currentIndex < 4 ? AppColors.azulPrincipal: AppColors.tomCinza),
                  elevation: WidgetStatePropertyAll(2),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))))
              ),
            ),
          ],
        ),
      ),
    );
  }
}
