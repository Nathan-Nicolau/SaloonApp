import 'package:saloon_app/src/widgets/Icone.dart';

class ItemMenuVO {
  Icone? iconeInicial;
  Icone? iconeFinal;
  int? codigo;
  String? descricao;

  ItemMenuVO.vazio() :
      iconeInicial = null,
      iconeFinal = null,
      codigo = null,
      descricao = null;

  ItemMenuVO(this.iconeInicial, this.iconeFinal, this.codigo, this.descricao);

  Icone? getIconeInicial() => iconeInicial;
  Icone? getIconeFinal() => iconeFinal;
  int? getCodigo() => codigo;
  String? getDescricao() => descricao;

  void setIconeInicial(Icone icone) {
    this.iconeInicial = icone;
  }

  void setIconeFinal(Icone icone) {
    this.iconeFinal = icone;
  }

  void setCodigo(int codigo) {
    this.codigo = codigo;
  }

  void setDescricao(String descricao) {
    this.descricao = descricao;
  }

}