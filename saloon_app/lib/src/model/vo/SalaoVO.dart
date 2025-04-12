import 'package:saloon_app/src/model/vo/HorarioFuncionamentoCompletoVO.dart';
import 'package:saloon_app/src/model/vo/ProprietarioSalaoVO.dart';

class SalaoVO {
  int? idSalao;
  String? nomeSalao;
  String? cnpjSalao;
  String? enderecoSalao;
  String? cepEndereco;
  String? numeroEndereco;
  String? cidadeEndereco;
  String? descricaoFuncionamento;
  String? codigoCompartilhamento;
  String? dataCadastroSalao;
  String? dataAtualizacaoCadastro;
  ProprietarioVO? proprietarioVO;
  HorarioFuncionamentoCompletoVO? horarioFuncionamentoCompletoVO;

  SalaoVO();

  SalaoVO.cadastro() {
    nomeSalao;
    enderecoSalao;
    proprietarioVO;
    horarioFuncionamentoCompletoVO;
  }

  int? getIdSalao() => idSalao;
  String? getNomeSalao() => nomeSalao;
  String? getCnpjSalao() => cnpjSalao;
  String? getEnderecoSalao() => enderecoSalao;
  String? getCepSalao() => cepEndereco;
  String? getNumeroEndereco() => numeroEndereco;
  String? getCidadeEndereco() => cidadeEndereco;
  String? getCodigoCompartilhamentp() => codigoCompartilhamento;
  String? getDescricaoFuncionamento() => descricaoFuncionamento;
  String? getDataCadastro() => dataCadastroSalao;
  String? getDataAtualizacao() => dataAtualizacaoCadastro;
  ProprietarioVO? getProprietario() => proprietarioVO;
  HorarioFuncionamentoCompletoVO? getHorarioFuncionamento() => horarioFuncionamentoCompletoVO;

  void setIdSalao(int idSalao) {
    this.idSalao = idSalao;
  }

  void setNomeSalao(String nomeSalao) {
    this.nomeSalao  = nomeSalao;
  }

  void setCnpjSalao(String cnpjSalao) {
    this.cnpjSalao = cnpjSalao;
  }

  void setEnderecoSalao(String enderecoSalao) {
    this.enderecoSalao = enderecoSalao;
  }

  void setCepEndereco(String cepEndereco) {
    this.cepEndereco = cepEndereco;
  }

  void setNumeroEndereco(String numeroEndereco) {
    this.numeroEndereco = numeroEndereco;
  }

  void setCidadeEndereco(String cidadeEndereco) {
    this.cidadeEndereco = cidadeEndereco;
  }

  void steCodigoCompartilhamento(String codigoCompartilhamento) {
    this.codigoCompartilhamento= codigoCompartilhamento;
  }

  void setDescricaoFuncionamento(String descricaoFuncionamento) {
    this.descricaoFuncionamento = descricaoFuncionamento;
  }

  void setDataCadastroSalao(String dataCadastroSalao) {
    this.dataCadastroSalao = dataCadastroSalao;
  }

  void setDataAtualizacaoCadastro(String dataAtualizacaoCadastro) {
    this.dataAtualizacaoCadastro = dataAtualizacaoCadastro;
  }

  void setProprietarioVo(ProprietarioVO proprietarioVo) {
    this.proprietarioVO = proprietarioVo;
  }

  void setHorarioFuncionamento(HorarioFuncionamentoCompletoVO horarioFuncionamento) {
    this.horarioFuncionamentoCompletoVO = horarioFuncionamento;
  }

}