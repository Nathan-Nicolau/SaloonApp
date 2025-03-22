import 'package:saloon_app/src/model/vo/AgendamentoVO.dart';

class AgendamentoDTO {
  int? id_agendamento;
  int? id_cliente;
  int? id_profissional;
  int? id_salao;
  int? id_servico;
  String? data_agendamento;
  String? horario_agendamento;
  String? status_agendamento;
  bool? agendamento_rapido;

  AgendamentoDTO.name(
      this.id_agendamento,
      this.id_cliente,
      this.id_profissional,
      this.id_salao,
      this.id_servico,
      this.data_agendamento,
      this.horario_agendamento,
      this.status_agendamento,
      this.agendamento_rapido);

  AgendamentoDTO();

  int get_id_agendamento() => id_agendamento ?? 0;
  int get_id_cliente() => id_cliente ?? 0;
  int get_id_profissional() => id_profissional ?? 0;
  int get_id_salao() => id_salao ?? 0;
  int get_id_servico() => id_servico ?? 0;
  String get_data_agendamento() => data_agendamento ?? "";
  String get_horario_agendamento() => horario_agendamento ?? "";
  String get_status_agendamento() => status_agendamento ?? "";
  bool get_agendamento_rapido() => agendamento_rapido ?? false;

  void set_id_agendamento(int? id_agendamento) {
    this.id_agendamento = id_agendamento;
  }

  void set_id_cliente(int? id_cliente) {
    this.id_cliente = id_cliente;
  }

  void set_id_profissional(int? id_profissional) {
    this.id_profissional = id_profissional;
  }

  void set_id_salao(int id_salao) {
    this.id_salao = id_salao;
  }

  void set_id_servico(int id_servico) {
    this.id_servico = id_servico;
  }

  void set_data_agendamento(String data_agendamento) {
    this.data_agendamento = data_agendamento;
  }

  void set_horario_agendamento(String horario_agendamento) {
    this.horario_agendamento = horario_agendamento;
  }

  void set_status_agendamento(String status_agendamento) {
    this.status_agendamento = status_agendamento;
  }

  void set_agendamento_rapido(bool agendamento_rapido) {
    this.agendamento_rapido = agendamento_rapido;
  }

  AgendamentoVO getAgendamentoVo() {
    var agendamentoVo = AgendamentoVO();
    agendamentoVo.setIdAgendamento(get_id_agendamento());
    agendamentoVo.setIdCliente(get_id_cliente());
    agendamentoVo.setIdProfissional(get_id_profissional());
    agendamentoVo.setIdSalao(get_id_salao());
    agendamentoVo.setIdServico(get_id_servico());
    agendamentoVo.setDataAgendamento(get_data_agendamento());
    agendamentoVo.setHorarioAgendamento(get_horario_agendamento());
    agendamentoVo.setStatusAgendamento(get_status_agendamento());
    agendamentoVo.setAgendamentoRapido(get_agendamento_rapido());
    return agendamentoVo;
  }


}