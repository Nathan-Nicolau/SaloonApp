
//Podemos considerar o padrão inicial de categorias como esses valores fixos de enum
import 'package:saloon_app/src/model/vo/CategoriaServicoVO.dart';

enum CategoriaServicoEnum {

  CABELO_MASCULINO(1,"Cabelo masculino"),
  CABELO_FEMININO(2,"Cabelo Feminino"),
  DEPILACAO(3,"Depilação"),
  MAQUIAGEM(4,"Maquiagem"),
  MANICURE(5,"Manicure"),
  OUTROS(6,"Outros");

  final int codigo;
  final String descricao;

  const CategoriaServicoEnum(this.codigo, this.descricao);

  static List<CategoriaServicoVO> getCategoriasBase() {
    List<CategoriaServicoVO> lista = [];
    for(var categoriaEnum in CategoriaServicoEnum.values) {
      lista.add(CategoriaServicoVO(categoriaEnum.codigo, categoriaEnum.descricao));
    }
    return lista;
  }

}