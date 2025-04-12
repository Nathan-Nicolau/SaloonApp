//Essa classe é para cadastro do planos existente dentro do sistema

import 'dart:ui';

class PlanoUsoSaloonVO {
   int? idPlanoUsoSaloon;
   String? nomePlano;
   String? descricao;
   double? valorPlano;
   int? qtdProfissionaisPermitidos;
   DateTime? dataCadastro;
   DateTime? dataAtualizacao;
   int? idUsuarioAtualizacao;
   Color? corPlano;

   int? getIdPlanoUsoSaloon() => idPlanoUsoSaloon;
   String? getNomePlano() => nomePlano;
   String? getDescricao() => descricao;
   double? getValorPlano() => valorPlano;
   int? getQuantidadeProfissionaisPermitidos() => qtdProfissionaisPermitidos;
   DateTime? getDataCadastro() => dataCadastro;
   DateTime? getDataAtualizacao() => dataAtualizacao;
   int? getIdUsuarioQueAtualizou() => idUsuarioAtualizacao;
   Color? getCorPlano() => corPlano;

   void setIdPlanoUsoSaloon(int idPlanoUsoSaloon) {
     this.idPlanoUsoSaloon = idPlanoUsoSaloon;
   }

   void setNomePlano(String nomePlano) {
     this.nomePlano = nomePlano;
   }

   void setDescricao(String descricao) {
     this.descricao = descricao;
   }

   void setValor(double valorPlano) {
     this.valorPlano = valorPlano;
   }

   void setQuantidadeProfissionaisPermitidos(int qtdProfissionaisPermitidos) {
     this.qtdProfissionaisPermitidos = qtdProfissionaisPermitidos;
   }

   void setDataCadastro(DateTime dataCadastro) {
     this.dataCadastro = dataCadastro;
   }

   void setDataAtualizacao(DateTime dataAtualizacao) {
     this.dataAtualizacao = dataAtualizacao;
   }

   void setIdUsuarioAtualizacao(int idUsuarioAtualizacao) {
     this.idUsuarioAtualizacao = idUsuarioAtualizacao;
   }

   void setCorPlano(Color corPlano) {
     this.corPlano = corPlano;
   }

}