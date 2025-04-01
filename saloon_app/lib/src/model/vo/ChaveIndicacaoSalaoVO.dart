
class ChaveIndicacaoSalaoVO {
  int? idChaveIndicacao;
  int? idSalao;
  String? valorChave;
  String? statusAtivacao;

  int? getIdchaveIndicacao() => idChaveIndicacao;
  int? getIdSalao() => idSalao;
  String? getValorChave() => valorChave;
  String? getStatusAtivacao() => statusAtivacao;

  void setIdChaveIndicacao(int idChaveIndicacao) {
    this.idChaveIndicacao = idChaveIndicacao;
  }

  void setIdSalao(int idSalao) {
    this.idSalao = idSalao;
  }

  void setValorChave(String valorChave) {
    this.valorChave = valorChave;
  }

  void setStatusAtivacao(String statusAtivacao) {
    this.statusAtivacao = statusAtivacao;
  }

}