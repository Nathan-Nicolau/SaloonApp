import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_popup/info_popup.dart';
import 'package:saloon_app/src/enums/CategoriaServicoEnum.dart';
import 'package:saloon_app/src/enums/DiasSemanaEnum.dart';
import 'package:saloon_app/src/model/vo/CategoriaServicoVO.dart';
import 'package:saloon_app/src/model/vo/DiaSemanaVO.dart';
import 'package:saloon_app/src/model/vo/HorarioFuncionamentoVO.dart';
import 'package:saloon_app/src/model/vo/SalaoVO.dart';
import 'package:saloon_app/src/model/vo/ServicoVO.dart';
import 'package:saloon_app/src/model/vo/UsuarioVO.dart';
import 'package:saloon_app/src/utils/UtilsUI.dart';
import 'package:saloon_app/src/widgets/BotaoPrimario.dart';
import 'package:saloon_app/src/widgets/Texto.dart';
import 'package:saloon_app/src/widgets/dialog/DialogConfirmacao.dart';
import 'package:saloon_app/src/widgets/dialog/DialogMensagem.dart';
import '../../utils/AppColors.dart';
import '../CampoTexto.dart';
import '../CardInfoServicoAdicionado.dart';
import '../CardServicoAdicionado.dart';
import '../ContainerServicoAdicionado.dart';
import '../dialog/DialogSelecaoHora.dart';

class CadastroSalaoWidget extends StatefulWidget {
  const CadastroSalaoWidget({super.key});

  @override
  State<CadastroSalaoWidget> createState() => _CadastroSalaoWidgetState();
}

class _CadastroSalaoWidgetState extends State<CadastroSalaoWidget> with TickerProviderStateMixin {

  //Esse valor de título é alterado conforme a página selecionada
  String tituloAppBar = "Acesso";
  int pagina = 0;
  int textoPagina = 1;
  int abaCategoria = 0;
  late UsuarioVO usuario;
  late SalaoVO salao;
  late List<CategoriaServicoVO> listaCategoriasBase;
  late List<CategoriaServicoVO> listaCategoriasSelecionadas;
  late final TabController tabController;
  late List<Widget> listaAbasCategorias;
  //Essa lista recebe todos os serviços cadastrados
  late List<ServicoVO> listaServicosTotais;
  late List<ServicoVO> listaServicosCabeloMasculino;
  late List<ServicoVO> listaServicosCabeloFeminino;
  late List<ServicoVO> listaServicosDepilacao;
  late List<ServicoVO> listaServicosManicure;
  late List<ServicoVO> listaServicosMaquiagem;
  late List<ServicoVO> listaServicosOutros;
  late ServicoVO servicoAdicionado;
  bool exibirDialogServicoIncorreto = false;
  bool exibirCardInfoServicoAdicionado = false;

  bool cabeloMasculino = false;
  bool cabeloFeminino = false;
  bool depilacao = false;
  bool maquiagem = false;
  bool manicure = false;
  bool outros = false;

  late List<DiaSemanaVO> listaDiasSemanaBase;
  late List<DiaSemanaVO> listaDiasSemanaSelecionados;
  late List<HorarioFuncionamentoVO> listaHorariosFuncionamento;

  bool segunda = false;
  bool terca = false;
  bool quarta = false;
  bool quinta= false;
  bool sexta = false;
  bool sabado = false;
  bool domingo = false;

  HorarioFuncionamentoVO horarioSegunda = HorarioFuncionamentoVO();
  HorarioFuncionamentoVO horarioTerca = HorarioFuncionamentoVO();
  HorarioFuncionamentoVO horarioQuarta = HorarioFuncionamentoVO();
  HorarioFuncionamentoVO horarioQuinta = HorarioFuncionamentoVO();
  HorarioFuncionamentoVO horarioSexta = HorarioFuncionamentoVO();
  HorarioFuncionamentoVO horarioSabado = HorarioFuncionamentoVO();
  HorarioFuncionamentoVO horarioDomingo = HorarioFuncionamentoVO();

  late TextEditingController segundaAberturaController;
  late TextEditingController segundaFechamentoController;
  late TextEditingController tercaAberturaController;
  late TextEditingController tercaFechamentoController;
  late TextEditingController quartaAberturaController;
  late TextEditingController quartaFechamentoController;
  late TextEditingController quintaAberturaController;
  late TextEditingController quintaFechamentoController;
  late TextEditingController sextaAberturaController;
  late TextEditingController sextaFechamentoController;
  late TextEditingController sabadoAberturaController;
  late TextEditingController sabadoFechamentoController;
  late TextEditingController domingoAberturaController;
  late TextEditingController domingoFechamentoController;

  @override
  void initState() {
    super.initState();
    usuario = UsuarioVO.vazio();
    salao = SalaoVO();
    servicoAdicionado = ServicoVO();
    listaCategoriasBase = CategoriaServicoEnum.getCategoriasBase();
    listaCategoriasSelecionadas = [];
    listaAbasCategorias = [];
    tabController = TabController(length: 6, vsync: this);
    listaServicosTotais = [];
    listaDiasSemanaBase = DiasSemanaEnum.getListaSemana();
    listaDiasSemanaSelecionados = [];
    listaHorariosFuncionamento = [];
    segundaAberturaController = TextEditingController(text: horarioSegunda.getHorarioAbertura());
    segundaFechamentoController = TextEditingController(text: horarioSegunda.getHorarioFechamento());
    tercaAberturaController = TextEditingController(text: horarioTerca.getHorarioAbertura());
    tercaFechamentoController = TextEditingController(text: horarioTerca.getHorarioFechamento());
    quartaAberturaController = TextEditingController(text: horarioQuarta.getHorarioAbertura());
    quartaFechamentoController = TextEditingController(text: horarioQuarta.getHorarioFechamento());
    quintaAberturaController = TextEditingController(text: horarioQuinta.getHorarioAbertura());
    quintaFechamentoController = TextEditingController(text: horarioQuinta.getHorarioFechamento());
    sextaAberturaController = TextEditingController(text: horarioSexta.getHorarioAbertura());
    sextaFechamentoController = TextEditingController(text: horarioSexta.getHorarioFechamento());
    sabadoAberturaController = TextEditingController(text: horarioSabado.getHorarioAbertura());
    sabadoFechamentoController = TextEditingController(text: horarioSabado.getHorarioFechamento());
    domingoAberturaController = TextEditingController(text: horarioDomingo.getHorarioAbertura());
    domingoFechamentoController = TextEditingController(text: horarioDomingo.getHorarioFechamento());
  }

  void setTextoPaginaAtual(bool proximo) {
    setState(() {
      if(proximo) {
        if(textoPagina < 6) {
          textoPagina++;
        }
      } else {
        if(textoPagina > 1) {
          textoPagina--;
        }
      }
    });
    validarTituloAppbar();
  }

  void proximaPagina() {
    setState(() {
      if(pagina < 5) {
        pagina++;
      }
    });
  }

  void paginaAnterior() {
    setState(() {
      if(pagina > 0) {
        pagina--;
      }
    });
  }

  void validarTituloAppbar() {
    setState(() {
      switch(textoPagina) {
        case 1:
          tituloAppBar = "Acesso";
          break;
        case 2:
          tituloAppBar = "Informações do local";
          break;
        case 3:
          tituloAppBar = "Categorias de Serviços";
          break;
        case 4:
          tituloAppBar = "Serviços oferecidos";
          break;
        case 5:
          tituloAppBar = "Seus serviços cadastrados";
          break;
        case 6:
          tituloAppBar = "Horário de funcionamento";
          break;
      }
    });
  }

  void ajustarListaCategoriasSelecionadas(int codigoCategoriaEnum, bool adicionar) {

    setState(() {
      List<CategoriaServicoVO> listaAuxiliar = [];

      for(var item in listaCategoriasBase) {
        if(item.idCategoriaServico == codigoCategoriaEnum) {
          for(var categoria in listaCategoriasSelecionadas) {
            if(adicionar) {
              if(categoria.idCategoriaServico != codigoCategoriaEnum) {
                listaAuxiliar.add(categoria);
              }
            } else {
              listaAuxiliar = listaCategoriasSelecionadas;
              listaAuxiliar.remove(categoria);
            }
          }
        }
      }
      listaCategoriasSelecionadas = listaAuxiliar;
    });
  }

  void ajustarListaDiasSemanaSelecionados(DiasSemanaEnum diaSemanaEnum, bool adicionar) {
    setState(() {
      switch(diaSemanaEnum) {
        case DiasSemanaEnum.SEGUNDA_FEIRA:
        default:
      }
    });
  }

  bool dadosServicoInformados(ServicoVO servicoVo) {
    var descricaoInformada = servicoVo.getDescricaoServico() != null;
    var valorInformado = servicoVo.getValor() != null;
    var tempoInformado = servicoVo.getTempoDuracao() != null;
    return descricaoInformada && valorInformado && tempoInformado;
  }

  void cadastrarNovoServico(ServicoVO novoServico) {
    setState(() {
      if(dadosServicoInformados(novoServico)) {
        adicionarServicoNaSuaLista(novoServico);
        // showCardServicoAdicionado();
        servicoAdicionado = ServicoVO();
      } else {
        //Quando os campos de informação do serviço não tiverem sido informados
        showDialog(context: context, builder: (BuildContext context) {
          return DialogMensagem(mensagem: "Há informações pendentes para o cadastro do serviço", onDismiss: () {
            Navigator.pop(context);
          });
        });
      }
    });
  }

  void adicionarServicoNaSuaLista(ServicoVO servico) {
    listaServicosTotais.add(servico);
  }

  void adicionarDiaSemanaNaSuaLista(DiaSemanaVO diaSemana) {
    listaDiasSemanaSelecionados.add(diaSemana);
  }

  void removerServico(ServicoVO servicoParaRemover) {
    setState(() {
      listaServicosTotais.remove(servicoParaRemover);
    });
  }

  void showDialogConfirmacao(ServicoVO servicoVo) {
    setState(() {
      showDialog(context: context, builder: (BuildContext context) {
        var descricaoServico = servicoVo.getDescricaoServico();
        return DialogConfirmacao(mensagem: "Deseja mesmo excluir o serviço $descricaoServico ?", onDismiss: (ok) {
          if(ok) {
            removerServico(servicoVo);
            Navigator.pop(context);
          } else {
            Navigator.pop(context);
          }
        });
      });
    });
  }

  void showCardServicoAdicionado() async {
    setState(() async {
      exibirCardInfoServicoAdicionado = true;
      await Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          exibirCardInfoServicoAdicionado = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    //Lista de telas construídas aqui
    List<Widget> telas = [
      //Primeira página - Acesso
      Container(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
        child: Column(
            spacing: 8,
            children: [
              //Nome de cadastro do usuário proprietário
              CampoTexto(valorTexto: usuario.getNomeUsuario(), label: "Nome do(a) responsável", placeholder: "Seu nome de usuário", textoAjudaInferior: "", corTexto: AppColors.preto, erro: false, aviso: false, iconeInicial: null, iconeFinal: null, onTextChange: (valorTexto) {
                usuario.setNomeUsuario(valorTexto);
              }),
              CampoTexto(valorTexto: usuario.getEmailUsuario(), label: "E-mail", placeholder: "Digite seu e-mail de acesso", textoAjudaInferior: "", corTexto: AppColors.preto, erro: false, aviso: false, iconeInicial: null, iconeFinal: null, onTextChange: (valorTexto) {
                usuario.setEmailUsuario(valorTexto);
              }),
              CampoTexto(valorTexto: usuario.getTelefoneUsuario(), label: "Telefone", placeholder: "Digite seu número de telefone", textoAjudaInferior: "", corTexto: AppColors.preto, erro: false, aviso: false, iconeInicial: null, iconeFinal: null, onTextChange: (valorTexto) {
                usuario.setTelefoneUsuario(valorTexto);
              }),
              CampoTexto(valorTexto: usuario.getSenhausuario(), label: "Senha", placeholder: "Mínimo de 8 caracteres", textoAjudaInferior: "", corTexto: AppColors.preto, erro: false, aviso: false, iconeInicial: null, iconeFinal: null, onTextChange: (valorTexto) {
                usuario.setSenhaUsuario(valorTexto);
              }),
            ]
        )
      ),
      //Segunda página - Informações do local
      Container(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
        child: Column(
            spacing: 8,
            children: [
              //Nome de cadastro do usuário proprietário
              CampoTexto(valorTexto: "", label: "Nome do estabelecimento", placeholder: "Nome do seu salão", textoAjudaInferior: "", corTexto: AppColors.preto, erro: false, aviso: false, iconeInicial: null, iconeFinal: null, onTextChange: (valorTexto) {
                salao.setNomeSalao(valorTexto);
              }),
              CampoTexto(valorTexto: "", label: "CEP", placeholder: "Digite apenas os números", textoAjudaInferior: "", corTexto: AppColors.preto, erro: false, aviso: false, iconeInicial: null, iconeFinal: null, onTextChange: (valorTexto) {
                salao.setCepEndereco(valorTexto);
              }),
              CampoTexto(valorTexto: "", label: "Endereço", placeholder: "Endereço do local", textoAjudaInferior: "", corTexto: AppColors.preto, erro: false, aviso: false, iconeInicial: null, iconeFinal: null, onTextChange: (valorTexto) {
                salao.setEnderecoSalao(valorTexto);
              }),
              CampoTexto(valorTexto: "", label: "Número", placeholder: "Do endereço", textoAjudaInferior: "", corTexto: AppColors.preto, erro: false, aviso: false, iconeInicial: null, iconeFinal: null, onTextChange: (valorTexto) {
                salao.setNumeroEndereco(valorTexto);
              })
            ]
        ),
      ),
      //Terceira página - Categorias de Serviços
      SizedBox(
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
          child: Column(
            spacing: 4,
            children: [
              const Texto(texto: "Informe as categorias de serviços que o seu estabelecimento oferece",tamanhoTexto: 14,peso: FontWeight.w600, cor: AppColors.preto),
              Row(
                children: [
                  Checkbox(value: cabeloMasculino,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                      onChanged: (valor) {
                    setState(() {
                      cabeloMasculino = valor!;
                    });
                    ajustarListaCategoriasSelecionadas(CategoriaServicoEnum.CABELO_MASCULINO.codigo, valor == true);
                  }),
                  const Texto(texto: "Cabelo masculino",tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto)
                ],
              ),
              Row(
                children: [
                  Checkbox(value: cabeloFeminino,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                      onChanged: (valor) {
                    setState(() {
                      cabeloFeminino = valor!;
                    });
                    ajustarListaCategoriasSelecionadas(CategoriaServicoEnum.CABELO_FEMININO.codigo, valor == true);
                  }),
                  const Texto(texto: "Cabelo feminino",tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto)
                ]
              ),
              Row(
                children: [
                  Checkbox(value: depilacao,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                      onChanged: (valor) {
                        setState(() {
                          depilacao = valor!;
                        });
                        ajustarListaCategoriasSelecionadas(CategoriaServicoEnum.DEPILACAO.codigo, valor == true);
                      }),
                  const Texto(texto: "Depilação",tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto)
                ],
              ),
              Row(
                children: [
                  Checkbox(value: maquiagem,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                      onChanged: (valor) {
                        setState(() {
                          maquiagem = valor!;
                        });
                        ajustarListaCategoriasSelecionadas(CategoriaServicoEnum.MAQUIAGEM.codigo, valor == true);
                      }),
                  const Texto(texto: "Maquiagem",tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto)
                ],
              ),
              Row(
                children: [
                  Checkbox(value: manicure,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                      onChanged: (valor) {
                        setState(() {
                          manicure = valor!;
                        });
                        ajustarListaCategoriasSelecionadas(CategoriaServicoEnum.MANICURE.codigo, valor == true);
                      }),
                  const Texto(texto: "Manicure",tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto)
                ],
              ),
              Row(
                children: [
                  Checkbox(value: outros,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                      onChanged: (valor) {
                        setState(() {
                          outros = valor!;
                        });
                        ajustarListaCategoriasSelecionadas(CategoriaServicoEnum.OUTROS.codigo, valor == true);
                      }),
                  const Texto(texto: "Outros",tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto)
                ],
              )
            ],
          )
        ),
      ),
      //Quarta página - Serviços oferecidos
      SizedBox(
        height: double.infinity,
          child: DefaultTabController(length: listaCategoriasSelecionadas.length,
              child: Column(
                children: [
                  TabBar(
                      controller: tabController,
                      isScrollable: true,
                      tabs: const [
                        SizedBox(height: 30, child: Texto(texto: "Cabelo masculino", tamanhoTexto: 14, peso: FontWeight.w400, cor: AppColors.azulPrincipal)),
                        SizedBox(height: 30, child: Texto(texto: "Cabelo feminino", tamanhoTexto: 14, peso: FontWeight.w400, cor: AppColors.azulPrincipal)),
                        SizedBox(height: 30, child: Texto(texto: "Depilação", tamanhoTexto: 14, peso: FontWeight.w400, cor: AppColors.azulPrincipal)),
                        SizedBox(height: 30, child: Texto(texto: "Manicure", tamanhoTexto: 14, peso: FontWeight.w400, cor: AppColors.azulPrincipal)),
                        SizedBox(height: 30, child: Texto(texto: "Maquiagem", tamanhoTexto: 14, peso: FontWeight.w400, cor: AppColors.azulPrincipal)),
                        SizedBox(height: 30, child: Texto(texto: "Outros", tamanhoTexto: 14, peso: FontWeight.w400, cor: AppColors.azulPrincipal))
                      ]
                  ),
                  Expanded(
                    child: LayoutBuilder(
                        builder: (BuildContext context, BoxConstraints constraints) {
                          return SizedBox(
                            height: constraints.maxHeight,
                            child: TabBarView(
                                controller: tabController,
                                children: [
                                  cabeloMasculino ?
                                  Column(
                                    children: [
                                      ContainerServicoAdicionado(categoriaServico: CategoriaServicoEnum.CABELO_MASCULINO, onRegister: (novoServico) {
                                        cadastrarNovoServico(novoServico);
                                      }),
                                      exibirCardInfoServicoAdicionado ?
                                          const CardInfoServicoAdicionado(descricaoServico: "teste") : const Row()
                                    ],
                                  ) : const InfoCategoriaDesabilitada(),
                                  cabeloFeminino ?
                                  ContainerServicoAdicionado(categoriaServico: CategoriaServicoEnum.CABELO_FEMININO, onRegister: (novoServico) {
                                    cadastrarNovoServico(novoServico);
                                  }) : const InfoCategoriaDesabilitada(),
                                  depilacao ?
                                  ContainerServicoAdicionado(categoriaServico: CategoriaServicoEnum.DEPILACAO, onRegister: (novoServico) {
                                    cadastrarNovoServico(novoServico);
                                  }) : const InfoCategoriaDesabilitada(),
                                  manicure ?
                                  ContainerServicoAdicionado(categoriaServico: CategoriaServicoEnum.MANICURE, onRegister: (novoServico) {
                                    cadastrarNovoServico(novoServico);
                                  }) : const InfoCategoriaDesabilitada(),
                                  maquiagem ?
                                  ContainerServicoAdicionado(categoriaServico: CategoriaServicoEnum.MAQUIAGEM, onRegister: (novoServico) {
                                    cadastrarNovoServico(novoServico);
                                  }) : const  InfoCategoriaDesabilitada(),
                                  outros ?
                                  ContainerServicoAdicionado(categoriaServico: CategoriaServicoEnum.OUTROS, onRegister: (novoServico) {
                                    cadastrarNovoServico(novoServico);
                                  }) : const InfoCategoriaDesabilitada()
                                ]
                            ),
                          );
                        }
                    ),
                  ),
                ],
              )
          )
      ),
      //Quinta página - Serviços adicionados
      SizedBox(
        child: Column(
          children: [
            listaServicosTotais.isNotEmpty
                ? Expanded( // Adicionado Expanded aqui para o ListView.builder
              child: ListView.builder(
                controller: ScrollController(),
                itemCount: listaServicosTotais.length,
                itemBuilder: (context, index) {
                  ServicoVO servico = listaServicosTotais[index];
                  return CardServicoAdicionado(
                    servicoVO: servico,
                    removerServico: (servico) {
                      showDialogConfirmacao(servico);
                    },
                  );
                },
              ),
            )
                : const SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Texto(
                            texto: "Parece que você ainda não cadastrou nenhum serviço",
                            tamanhoTexto: 16,
                            peso: FontWeight.w600,
                            cor: AppColors.preto),
                            Texto(
                                texto: "Clique no botão voltar e adicione algum serviço",
                                tamanhoTexto: 14,
                                peso: FontWeight.normal,
                                cor: AppColors.preto)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
          ],
        ),
      ),
      //Sexta página - Horário funcionamento
      SizedBox(
        child: Padding(padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Column(
                children: [
                  Texto(texto: "Informe os dias de funcionamento do seu estabelecimento", tamanhoTexto: 14, peso: FontWeight.normal, cor: AppColors.preto),
                  Texto(texto: "Ao informar os horários, prefira por valores de hora completa, como 08:00 e 18:00", tamanhoTexto: 12, peso: FontWeight.w300, cor: AppColors.preto),
                ],
              )),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                child: Row(
                  children: [
                    Texto(texto: "Você pode alterar essa informações depois", tamanhoTexto: 12, peso: FontWeight.w300, cor: AppColors.preto),
                  ],
                ),
              ),
              //Segunda-feira
              Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            value: segunda,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                            onChanged: (valor) {
                              setState(() {
                                segunda = valor!;
                                if(segunda) {
                                  showDialog(context: context, builder: (builder) {
                                    return DialogSelecaoHora(onHoraSelecionada: (hora) {

                                    });
                                  });
                                }
                              });
                            }
                        ),
                        const Texto(texto: "Segunda", tamanhoTexto: 14, peso: FontWeight.w500, cor: AppColors.preto),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Texto(texto: "de", tamanhoTexto: 14, peso: FontWeight.w300, cor: AppColors.preto),
                      SizedBox(
                        width: 64,
                        child: TextField(
                          onChanged: (valorAbertura) {
                            setState(() {
                              horarioSegunda.setHorarioAbertura(valorAbertura);
                            });
                          },
                          enabled: segunda,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: "08:00",
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.cinza
                              )
                          ),
                          controller: segundaAberturaController,
                        ),
                      ),
                      const Texto(texto: "às", tamanhoTexto: 14, peso: FontWeight.w300, cor: AppColors.preto),
                      SizedBox(
                        width: 64,
                        child: TextField(
                          onChanged: (valorFechamento) {
                            setState(() {
                              horarioSegunda.setHorarioFechamento(valorFechamento);
                            });
                          },
                          enabled: segunda,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: "18:00",
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.cinza
                              )
                          ),
                          controller: segundaFechamentoController,
                        ),
                      )
                    ],
                  )
                ],
              ),
              //Terça-feira
              Row(
                children: [
                  SizedBox(
                    width:120,
                    child: Row(
                      children: [
                        Checkbox(
                            value: terca,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                            onChanged: (valor) {
                              setState(() {
                                terca = valor!;
                              });
                            }
                        ),
                        const Texto(texto: "Terça", tamanhoTexto: 14, peso: FontWeight.w500, cor: AppColors.preto)
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Texto(texto: "de", tamanhoTexto: 14, peso: FontWeight.w300, cor: AppColors.preto),
                      SizedBox(
                        width: 64,
                        child: TextField(
                          onChanged: (valorAbertura) {
                            setState(() {
                              horarioTerca.setHorarioAbertura(valorAbertura);
                            });
                          },
                          enabled: terca,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: "08:00",
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.cinza
                              )
                          ),
                          controller: tercaAberturaController,
                        ),
                      ),
                      const Texto(texto: "às", tamanhoTexto: 14, peso: FontWeight.w300, cor: AppColors.preto),
                      SizedBox(
                        width: 64,
                        child: TextField(
                          onChanged: (valorFechamento) {
                            setState(() {
                              horarioTerca.setHorarioFechamento(valorFechamento);
                            });
                          },
                          enabled: terca,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: "18:00",
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.cinza
                              )
                          ),
                          controller: tercaFechamentoController,
                        ),
                      )
                    ],
                  )
                ],
              ),
              //Quarta feira
              Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: Row(
                      children: [
                        Checkbox(
                            value: quarta,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                            onChanged: (valor) {
                              setState(() {
                                quarta = valor!;
                              });
                            }
                        ),
                        const Texto(texto: "Quarta", tamanhoTexto: 14, peso: FontWeight.w500, cor: AppColors.preto)
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Texto(texto: "de", tamanhoTexto: 14, peso: FontWeight.w300, cor: AppColors.preto),
                      SizedBox(
                        width: 64,
                        child: TextField(
                          onChanged: (valorAbertura) {
                            setState(() {
                              horarioQuarta.setHorarioAbertura(valorAbertura);
                            });
                          },
                          enabled: quarta,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: "08:00",
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.cinza
                              )
                          ),
                          controller: quartaAberturaController,
                        ),
                      ),
                      const Texto(texto: "às", tamanhoTexto: 14, peso: FontWeight.w300, cor: AppColors.preto),
                      SizedBox(
                        width: 64,
                        child: TextField(
                          onChanged: (valorFechamento) {
                            setState(() {
                              horarioQuarta.setHorarioFechamento(valorFechamento);
                            });
                          },
                          enabled: quarta,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: "18:00",
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.cinza
                              )
                          ),
                          controller: quintaAberturaController,
                        ),
                      )
                    ],
                  )
                ],
              ),
              //Quinta-feira
              Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: Row(
                      children: [
                        Checkbox(
                            value: quinta,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                            onChanged: (valor) {
                              setState(() {
                                quinta = valor!;
                              });
                            }
                        ),
                        const Texto(texto: "Quinta", tamanhoTexto: 14, peso: FontWeight.w500, cor: AppColors.preto)
                      ],
                    ),
                  ),
                  Row(
                    children: [const Texto(texto: "de", tamanhoTexto: 14, peso: FontWeight.w300, cor: AppColors.preto),
                      SizedBox(
                        width: 64,
                        child: TextField(
                          onChanged: (valorAbertura) {
                            setState(() {
                              horarioQuinta.setHorarioAbertura(valorAbertura);
                            });
                          },
                          enabled: quinta,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: "08:00",
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.cinza
                              )
                          ),
                          controller: quintaAberturaController,
                        ),
                      ),
                      const Texto(texto: "às", tamanhoTexto: 14, peso: FontWeight.w300, cor: AppColors.preto),
                      SizedBox(
                        width: 64,
                        child: TextField(
                          onChanged: (valorFechamento) {
                            setState(() {
                              horarioQuinta.setHorarioFechamento(valorFechamento);
                            });
                          },
                          enabled: quinta,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: "18:00",
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.cinza
                              )
                          ),
                          controller: quintaFechamentoController,
                        ),
                      )],
                  )
                ],
              ),
              //Sexta-feira
              Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: Row(
                      children: [
                        Checkbox(
                            value: sexta,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                            onChanged: (valor) {
                              setState(() {
                                sexta = valor!;
                              });
                            }
                        ),const Texto(texto: "Sexta", tamanhoTexto: 14, peso: FontWeight.w500, cor: AppColors.preto)
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Texto(texto: "de", tamanhoTexto: 14, peso: FontWeight.w300, cor: AppColors.preto),
                      SizedBox(
                        width: 64,
                        child: TextField(
                          onChanged: (valorAbertura) {
                            setState(() {
                              horarioSexta.setHorarioAbertura(valorAbertura);
                            });
                          },
                          enabled: sexta,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: "08:00",
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.cinza
                              )
                          ),
                          controller: sextaAberturaController,
                        ),
                      ),
                      const Texto(texto: "às", tamanhoTexto: 14, peso: FontWeight.w300, cor: AppColors.preto),
                      SizedBox(
                        width: 64,
                        child: TextField(
                          onChanged: (valorFechamento) {
                            setState(() {
                              horarioSexta.setHorarioFechamento(valorFechamento);
                            });
                          },
                          enabled: sexta,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: "18:00",
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.cinza
                              )
                          ),
                          controller: sextaFechamentoController,
                        ),
                      )],
                  )
                ],
              ),
              //Sábado
              Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: Row(
                      children: [
                        Checkbox(
                            value: sabado,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                            onChanged: (valor) {
                              setState(() {
                                sabado = valor!;
                                if(!sabado) {
                                  horarioSabado.setHorarioAbertura("");
                                  horarioSabado.setHorarioFechamento("");
                                }
                              });
                            }
                        ),
                        const Texto(texto: "Sábado", tamanhoTexto: 14, peso: FontWeight.w500, cor: AppColors.preto)
                      ]
                    ),
                  ),
                  Row(
                    children: [
                      const Texto(texto: "de", tamanhoTexto: 14, peso: FontWeight.w300, cor: AppColors.preto),
                      SizedBox(
                        width: 64,
                        child: TextField(
                          autocorrect: false,
                          keyboardType: TextInputType.number,
                          onChanged: (valorAbertura) {
                            setState(() {
                              horarioSabado.setHorarioAbertura(valorAbertura);
                            });
                          },
                          enabled: sabado,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: "08:00",
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.cinza
                              )
                          ),
                          controller: sabadoAberturaController,
                        ),
                      ),
                      const Texto(texto: "às", tamanhoTexto: 14, peso: FontWeight.w300, cor: AppColors.preto),
                      SizedBox(
                        width: 64,
                        child: TextField(
                          autocorrect: false,
                          keyboardType: TextInputType.number,
                          onChanged: (valorFechamento) {
                            setState(() {
                              horarioSabado.setHorarioFechamento(valorFechamento);
                            });
                          },
                          enabled: sabado,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: "18:00",
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.cinza
                              )
                          ),
                          controller: sabadoFechamentoController,
                        ),
                      )
                    ],
                  )
                ],
              ),
              //Domingo
              Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: Row(
                      children: [
                        Checkbox(
                            value: domingo,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                            onChanged: (valor) {
                              setState(() {
                                domingo = valor!;
                                if(!domingo) {
                                  horarioDomingo.setHorarioAbertura("");
                                  horarioDomingo.setHorarioFechamento("");
                                }
                              });
                            }
                        ),
                        const Texto(texto: "Domingo", tamanhoTexto: 14, peso: FontWeight.w500, cor: AppColors.preto),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Texto(texto: "de", tamanhoTexto: 14, peso: FontWeight.w300, cor: AppColors.preto),
                      SizedBox(
                        width: 64,
                        child: TextField(
                          autocorrect: false,
                          keyboardType: TextInputType.number,
                          onChanged: (valorAbertura) {
                            setState(() {
                              horarioDomingo.setHorarioAbertura(valorAbertura);
                            });
                          },
                          enabled: domingo,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: "08:00",
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.cinza
                              )
                          ),
                          controller: domingoAberturaController,
                        ),
                      ),
                      const Texto(texto: "às", tamanhoTexto: 14, peso: FontWeight.w300, cor: AppColors.preto),
                      SizedBox(
                        width: 64,
                        child: TextField(
                          autocorrect: false,
                          keyboardType: TextInputType.number,
                          onChanged: (valorFechamento) {
                            setState(() {
                              horarioDomingo.setHorarioFechamento(valorFechamento);
                            });
                          },
                          enabled: domingo,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: "12:00",
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.cinza
                              )
                          ),
                          controller: domingoFechamentoController,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          )
        ),
      )
    ];
    
    return Scaffold(
      appBar: AppBar(
        title: Texto(texto: tituloAppBar, tamanhoTexto: 18, peso: FontWeight.bold, cor: AppColors.preto),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
            child: Texto(texto: "$textoPagina/6", tamanhoTexto: 16, peso: FontWeight.w600, cor: AppColors.preto)
          )

        ],
      ),
      body: IndexedStack(
        index: pagina,
        children: telas,
      ),
      bottomNavigationBar: Padding(
        padding: UtilsUI.padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BotaoPrimario(onPressed: () {
              paginaAnterior();
              setTextoPaginaAtual(false);
            }, textoBotao: "Voltar"),
            BotaoPrimario(onPressed: () {
              proximaPagina();
              setTextoPaginaAtual(true);
            }, textoBotao: "Avançar")
          ],
        ),
      ),
    );
  }
  
}

class InfoCategoriaDesabilitada extends StatelessWidget {
  const InfoCategoriaDesabilitada({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Padding(padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text("Essa categoria não foi selecionada\npara que serviços possam ser adicionados a ela",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.normal), textAlign: TextAlign.center)
          ],
        ),),
      ),
    );
  }
}
