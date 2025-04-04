import 'package:saloon_app/src/enums/CategoriaServicoEnum.dart';

class ServicoVO {
  int? idServico;
  int? idSalao;
  String? descricaoServico;
  //TODO - Analisar necessidade desse campo direto de imagem
  String? tempoDuracao;
  double? valor;
  int? idCategoria;
  CategoriaServicoEnum? categoriaEnum;
  DateTime? dataCadastro;
  DateTime? dataAtualizacao;

  int? getIdServico() => idServico;
  int? getIdSalao() => idSalao;
  String? getDescricaoServico() => descricaoServico;
  String? getTempoDuracao() => tempoDuracao;
  double? getValor() => valor;
  int? getIdCategoriaServico() => idCategoria;
  CategoriaServicoEnum? getCategoriaServicoEnum() => categoriaEnum;
  DateTime? getDataCadastro() => dataCadastro;
  DateTime? getDataAtualizacao() => dataAtualizacao;

  void setIdServico(int idServico) {
    this.idServico  = idServico;
  }

  void setIdSalao(int idSalao) {
    this.idSalao = idSalao;
  }

  void setDescricaoServico(String descricaoServico) {
    this.descricaoServico = descricaoServico;
  }

  void setTempoDuracao(String tempoDuracao) {
    this.tempoDuracao = tempoDuracao;
  }

  void setValor(double valor) {
    this.valor = valor;
  }

  void setIdCategoria(int idCategoria) {
    this.idCategoria = idCategoria;
  }

  void setCategoraServicoEnum(CategoriaServicoEnum categoriaEnum) {
    this.categoriaEnum = categoriaEnum;
  }

  void setDataCadastro(DateTime dataCadastro) {
    this.dataCadastro = dataCadastro;
  }

  void setDataAtualizacao(DateTime dataAtualizacao) {
    this.dataAtualizacao = dataAtualizacao;
  }

}