enum TipoUsuarioSaloon {

  PROPRIETARIO(1,"Proprietátio de estabelecimento"),
  PROFISSIONAL(2,"Profissional de um estabelecimento"),
  CLIENTE(3,"Consumidor");

  final int codigo;
  final String descricao;

  const TipoUsuarioSaloon(this.codigo, this.descricao);

  static TipoUsuarioSaloon getTipoUsuarioPorCodigo(int? codigo) {
    if(codigo != null) {
      switch(codigo) {
        case 1:
          return TipoUsuarioSaloon.PROPRIETARIO;
        case 2:
          return TipoUsuarioSaloon.PROFISSIONAL;
        case 3:
          return TipoUsuarioSaloon.CLIENTE;
      }
    }
    return TipoUsuarioSaloon.CLIENTE;
  }

}