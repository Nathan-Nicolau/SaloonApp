import 'package:saloon_app/src/model/vo/HorarioFuncionamentoVO.dart';

class HorarioFuncionamentoCompletoVO {
  HorarioFuncionamentoVO? horarioSegunda;
  HorarioFuncionamentoVO? horarioTerca;
  HorarioFuncionamentoVO? horarioQuarta;
  HorarioFuncionamentoVO? horarioQuinta;
  HorarioFuncionamentoVO? horarioSexta;
  HorarioFuncionamentoVO? horarioSabado;
  HorarioFuncionamentoVO? horarioDomingo;

  HorarioFuncionamentoVO? getHorarioSegunda() => horarioSegunda;
  HorarioFuncionamentoVO? getHorarioTerca() => horarioTerca;
  HorarioFuncionamentoVO? getHorarioQuarta() => horarioQuarta;
  HorarioFuncionamentoVO? getHOrarioQuinta() => horarioQuarta;
  HorarioFuncionamentoVO? getHorarioSexta() => horarioSexta;
  HorarioFuncionamentoVO? getHorarioSabado() => horarioSabado;
  HorarioFuncionamentoVO? getHorarioDomingo() => horarioDomingo;

  void setHorarioSegunda(HorarioFuncionamentoVO horarioSegunda) { this.horarioSegunda = horarioSegunda;}
  void setHorarioTerca(HorarioFuncionamentoVO horarioTerca) { this.horarioTerca = horarioTerca; }
  void setHorarioQuarta(HorarioFuncionamentoVO horarioQuarta) { this.horarioQuarta = horarioQuarta; }
  void setHorarioQuinta(HorarioFuncionamentoVO horarioQuinta) { this.horarioQuinta = horarioQuinta; }
  void setHorarioSexta(HorarioFuncionamentoVO horarioSexta) { this.horarioSexta = horarioSexta; }
  void setHorarioSabado(HorarioFuncionamentoVO horarioSabado) { this.horarioSabado = horarioSabado; }
  void setHorarioDomingo(HorarioFuncionamentoVO horarioDomingo) { this.horarioDomingo = horarioDomingo; }



}