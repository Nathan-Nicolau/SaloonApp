import 'package:flutter/material.dart';
import 'package:saloon_app/src/utils/AppColors.dart';
import 'package:saloon_app/src/widgets/Texto.dart';

class AbaPagamentoMensal extends StatefulWidget {

  bool confirmacaoEstouCiente;
  Function(bool) setEstouCiente;

  AbaPagamentoMensal({required this.confirmacaoEstouCiente, required this.setEstouCiente, super.key});

  @override
  State<AbaPagamentoMensal> createState() => _AbaPagamentoMensalState();
}

class _AbaPagamentoMensalState extends State<AbaPagamentoMensal> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Texto(texto: "Pagamento mensal", tamanhoTexto: 16, peso: FontWeight.w700, cor: AppColors.preto),
          Texto(texto: "O plano de uso do sistema Saloon funciona como um serviço de assinatura mensal, cujo pagamento deve ser feito por cobrança automática. O não pagamento da mensalidade até a data de vencimento, ocasionará no bloqueio de acesso do administrador e profissionais vinculados ao salão.", tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto),
          SizedBox(height: 8),
          Row(
            children: [
              Checkbox(
                  value: widget.confirmacaoEstouCiente, onChanged: (valor) {
                setState(() {
                  widget.setEstouCiente(valor!);
                });
              }),
              Texto(texto: "Estou ciente e concordo", tamanhoTexto: 14, peso: FontWeight.w600, cor: AppColors.preto)
            ],
          )
        ],
      )),
    );
  }

}
