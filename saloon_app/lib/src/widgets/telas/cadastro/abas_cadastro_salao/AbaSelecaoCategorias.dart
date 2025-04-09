// import 'package:flutter/material.dart';
// import '../../../../utils/AppColors.dart';
// import '../../../Texto.dart';
//
// class AbaSelecaoCategorias extends StatefulWidget {
//
//   bool cabeloMasculino;
//   bool cabeloFeminino;
//   bool depilacao;
//   bool maquiagem;
//   bool manicure;
//   bool outros;
//   Function(int,bool) adicionarCategoria;
//
//   const AbaSelecaoCategorias({super.key});
//
//   @override
//   State<AbaSelecaoCategorias> createState() => _AbaSelecaoCategoriasState();
// }
//
// class _AbaSelecaoCategoriasState extends State<AbaSelecaoCategorias> {
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: Container(
//           padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
//           child: Column(
//             spacing: 4,
//             children: [
//               const Text(texto: "Informe as categorias de serviços que o seu estabelecimento oferece",tamanhoTexto: 14,peso: FontWeight.w600, cor: AppColors.preto),
//               Row(
//                 children: [
//                   Checkbox(value: cabeloMasculino,
//                       shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
//                       onChanged: (valor) {
//                         setState(() {
//                           cabeloMasculino = valor!;
//                         });
//                         ajustarListaCategoriasSelecionadas(CategoriaServicoEnum.CABELO_MASCULINO.codigo, valor == true);
//                       }),
//                   const Texto(texto: "Cabelo masculino",tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto)
//                 ],
//               ),
//               Row(
//                   children: [
//                     Checkbox(value: cabeloFeminino,
//                         shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
//                         onChanged: (valor) {
//                           setState(() {
//                             cabeloFeminino = valor!;
//                           });
//                           ajustarListaCategoriasSelecionadas(CategoriaServicoEnum.CABELO_FEMININO.codigo, valor == true);
//                         }),
//                     const Texto(texto: "Cabelo feminino",tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto)
//                   ]
//               ),
//               Row(
//                 children: [
//                   Checkbox(value: depilacao,
//                       shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
//                       onChanged: (valor) {
//                         setState(() {
//                           depilacao = valor!;
//                         });
//                         ajustarListaCategoriasSelecionadas(CategoriaServicoEnum.DEPILACAO.codigo, valor == true);
//                       }),
//                   const Texto(texto: "Depilação",tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto)
//                 ],
//               ),
//               Row(
//                 children: [
//                   Checkbox(value: maquiagem,
//                       shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
//                       onChanged: (valor) {
//                         setState(() {
//                           maquiagem = valor!;
//                         });
//                         ajustarListaCategoriasSelecionadas(CategoriaServicoEnum.MAQUIAGEM.codigo, valor == true);
//                       }),
//                   const Texto(texto: "Maquiagem",tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto)
//                 ],
//               ),
//               Row(
//                 children: [
//                   Checkbox(value: manicure,
//                       shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
//                       onChanged: (valor) {
//                         setState(() {
//                           manicure = valor!;
//                         });
//                         ajustarListaCategoriasSelecionadas(CategoriaServicoEnum.MANICURE.codigo, valor == true);
//                       }),
//                   const Texto(texto: "Manicure",tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto)
//                 ],
//               ),
//               Row(
//                 children: [
//                   Checkbox(value: outros,
//                       shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
//                       onChanged: (valor) {
//                         setState(() {
//                           outros = valor!;
//                         });
//                         ajustarListaCategoriasSelecionadas(CategoriaServicoEnum.OUTROS.codigo, valor == true);
//                       }),
//                   const Texto(texto: "Outros",tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto)
//                 ],
//               )
//             ],
//           )
//       ),
//     )
//   }
//
// }
