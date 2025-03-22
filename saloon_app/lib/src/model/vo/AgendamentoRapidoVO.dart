class AgendamentoRapidoVO {
  String? nomeCliente;
  String? telefoneCliente;
  String? codigoAgendamentoSalao;

  AgendamentoRapidoVO();

  static AgendamentoRapidoVO agendamentoRapidoVazio = AgendamentoRapidoVO();

  String getNomeCliente() => nomeCliente ?? "";
  String getTelefoneCliente() => telefoneCliente ?? "";
  String getCodigoAgendamentoSalao() => codigoAgendamentoSalao ?? "";

  void setNomeCliente(String nomeCliente) {
    this.nomeCliente = nomeCliente;
  }

  void setTelefoneCliente(String telefoneCliente) {
    this.telefoneCliente = telefoneCliente;
  }

  void setCodigoAgendamentoSalao(String codigoAgendamentoSalao) {
    this.codigoAgendamentoSalao = codigoAgendamentoSalao;
  }


}