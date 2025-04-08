import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_popup/info_popup.dart';
import 'package:saloon_app/src/enums/CategoriaServicoEnum.dart';
import 'package:saloon_app/src/enums/DiasSemanaEnum.dart';
import 'package:saloon_app/src/model/vo/CategoriaServicoVO.dart';
import 'package:saloon_app/src/model/vo/DiaSemanaVO.dart';
import 'package:saloon_app/src/model/vo/HorarioFuncionamentoCompletoVO.dart';
import 'package:saloon_app/src/model/vo/HorarioFuncionamentoVO.dart';
import 'package:saloon_app/src/model/vo/SalaoVO.dart';
import 'package:saloon_app/src/model/vo/ServicoVO.dart';
import 'package:saloon_app/src/model/vo/UsuarioVO.dart';
import 'package:saloon_app/src/utils/UtilsUI.dart';
import 'package:saloon_app/src/widgets/BotaoPrimario.dart';
import 'package:saloon_app/src/widgets/Texto.dart';
import 'package:saloon_app/src/widgets/dialog/DialogConfirmacao.dart';
import 'package:saloon_app/src/widgets/dialog/DialogMensagem.dart';
import 'package:saloon_app/src/widgets/telas/AbaCadastroHorarios.dart';
import '../../utils/AppColors.dart';
import '../CampoTexto.dart';
import '../CardInfoServicoAdicionado.dart';
import '../CardServicoAdicionado.dart';
import '../ContainerServicoAdicionado.dart';
import '../HorarioFuncionamento.dart';
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
  late HorarioFuncionamentoCompletoVO horarioFuncionamentoCompletoVO;

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
      AbaCadastroHorarios(setHorarios: (horarioCompleto) {
        setState(() {
          horarioFuncionamentoCompletoVO = horarioCompleto;
        });
      })
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
