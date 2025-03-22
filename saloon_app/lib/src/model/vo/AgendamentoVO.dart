
//Classe de valor para representação da entidade de Agendamento de serviços

import 'package:saloon_app/src/model/dto/AgendamentoDTO.dart';

class AgendamentoVO {
    int? idAgendamento;
    int? idCliente;
    int? idProfissional;
    int? idSalao;
    int? idServico;
    String? dataAgendamento;
    String? horarioAgendamento;
    String? statusAgendamento;
    bool? agendamentoRapido;

    AgendamentoVO();

    static AgendamentoVO agendamentoVazioVo = AgendamentoVO();

    // Getters
    int getIdAgendamento() => idAgendamento ?? 0;
    int getIdCliente() => idCliente ?? 0;
    int getIdProfissional() => idProfissional ?? 0;
    int getIdSalao() => idSalao ?? 0;
    int getIdServico() => idServico ?? 0;
    String getDataAgendamento() => dataAgendamento ?? "";
    String getHorarioAgendamento() => horarioAgendamento ?? "";
    String getStatusAgendamento() => statusAgendamento ?? "";
    bool getAgendamentoRapido() => agendamentoRapido ?? false;

    // Setters
    void setIdAgendamento(int idAgendamento) {
        this.idAgendamento = idAgendamento;
    }

    void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    void setIdProfissional(int idProfissional) {
      idProfissional = idProfissional;
    }

    void setIdSalao(int idSalao) {
      idSalao = idSalao;
    }

    void setIdServico(int idServico) {
      idServico = idServico;
    }

    void setDataAgendamento(String dataAgendamento) {
      dataAgendamento = dataAgendamento;
    }

    void setHorarioAgendamento(String horarioAgendamento) {
      horarioAgendamento = horarioAgendamento;
    }

    void setStatusAgendamento(String statusAgendamento) {
      statusAgendamento = statusAgendamento;
    }

    void setAgendamentoRapido(bool agendamentoRapido) {
        this.agendamentoRapido = agendamentoRapido;
    }

    AgendamentoDTO toAgendamentoDTO() {
        var agendamentoDto = AgendamentoDTO();
        agendamentoDto.set_id_agendamento(getIdAgendamento());
        agendamentoDto.set_id_cliente(getIdCliente());
        agendamentoDto.set_id_profissional(getIdProfissional());
        agendamentoDto.set_id_salao(getIdSalao());
        agendamentoDto.set_id_servico(getIdServico());
        agendamentoDto.set_data_agendamento(getDataAgendamento());
        agendamentoDto.set_horario_agendamento(getHorarioAgendamento());
        agendamentoDto.set_status_agendamento(getStatusAgendamento());
        agendamentoDto.set_agendamento_rapido(getAgendamentoRapido());
        return agendamentoDto;
    }

}