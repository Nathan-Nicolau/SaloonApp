class DiaSemanaVO {
  late int diaSemana;
  late String nomeDiaSemana;

   DiaSemanaVO({required this.diaSemana, required this.nomeDiaSemana});

   int getDiaSemana() => diaSemana;
   String getNomeDiaSemana() => nomeDiaSemana;

   void setDiaSemana(int diaSemana) {
     this.diaSemana = diaSemana;
   }

   void setNomeDiaSemana(String nomeDiaSemana) {
     this.nomeDiaSemana = nomeDiaSemana;
   }

}