import 'package:flutter/material.dart';
import 'package:saloon_app/src/enums/CategoriaServicoEnum.dart';
import 'package:saloon_app/src/model/vo/CategoriaServicoVO.dart';
import 'package:saloon_app/src/model/vo/SalaoVO.dart';
import 'package:saloon_app/src/model/vo/ServicoVO.dart';
import 'package:saloon_app/src/model/vo/UsuarioVO.dart';
import 'package:saloon_app/src/utils/UtilsUI.dart';
import 'package:saloon_app/src/widgets/BotaoPrimario.dart';
import 'package:saloon_app/src/widgets/Texto.dart';
import 'package:saloon_app/src/widgets/dialog/DialogMensagem.dart';

import '../../utils/AppColors.dart';
import '../CampoTexto.dart';

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
  late List<ServicoVO> listaServicos;
  late ServicoVO servicoAdicionado;
  bool exibirDialogServicoIncorreto = false;

  bool cabeloMasculino = false;
  bool cabeloFeminino = false;
  bool depilacao = false;
  bool maquiagem = false;
  bool manicure = false;
  bool outros = false;

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
    listaServicos = [];
  }

  void setTextoPaginaAtual(bool proximo) {
    setState(() {
      if(proximo) {
        if(textoPagina < 5) {
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
      if(pagina < 4) {
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
          tituloAppBar = "Horário de funcionamento";
          break;
      }
    });
  }

  void ajustarListaCategoriasSelecionadas(int codigoCategoriaEnum, bool adicionar) {

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
  }

  void cadastrarNovoServico(ServicoVO novoServico) {
    setState(() {
      if(novoServico.getDescricaoServico() != null) {
        listaServicos.add(servicoAdicionado);
        servicoAdicionado = ServicoVO();
      } else {
        showDialog(context: context, builder: (BuildContext context) {
          return DialogMensagem(mensagem: "Há informações pendentes no serviço informado", onDismiss: () {
            Navigator.pop(context);
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    //Lista de telas construídas aqui
    List<Widget> telas = [
      //Primeira página
      Expanded(
          child: Container(
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
          )
      ),
      //Segunda página
      Expanded(
          child: Container(
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
          )
      ),
      //Terceira página
      Expanded(
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
      //Quarta página
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
                                  ContainerServicoAdicionado(codigCategoriaServico: CategoriaServicoEnum.CABELO_MASCULINO.codigo, onRegister: (novoServico) {
                                    cadastrarNovoServico(novoServico);
                                  }),ContainerServicoAdicionado(codigCategoriaServico: CategoriaServicoEnum.CABELO_FEMININO.codigo, onRegister: (novoServico) {
                                    cadastrarNovoServico(novoServico);
                                  }),ContainerServicoAdicionado(codigCategoriaServico: CategoriaServicoEnum.DEPILACAO.codigo, onRegister: (novoServico) {
                                    cadastrarNovoServico(novoServico);
                                  }),ContainerServicoAdicionado(codigCategoriaServico: CategoriaServicoEnum.MANICURE.codigo, onRegister: (novoServico) {
                                    cadastrarNovoServico(novoServico);
                                  }),ContainerServicoAdicionado(codigCategoriaServico: CategoriaServicoEnum.MAQUIAGEM.codigo, onRegister: (novoServico) {
                                    cadastrarNovoServico(novoServico);
                                  }),ContainerServicoAdicionado(codigCategoriaServico: CategoriaServicoEnum.OUTROS.codigo, onRegister: (novoServico) {
                                    cadastrarNovoServico(novoServico);
                                  })
                                ]
                            ),
                          );
                        }
                    ),
                  ),
                ],
              )
          )
      )
    ];
    
    return Scaffold(
      appBar: AppBar(
        title: Texto(texto: tituloAppBar, tamanhoTexto: 18, peso: FontWeight.bold, cor: AppColors.preto),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
            child: Texto(texto: "$textoPagina/5", tamanhoTexto: 16, peso: FontWeight.w600, cor: AppColors.preto)
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
            BotaoPrimario(() {
              paginaAnterior();
              setTextoPaginaAtual(false);
            }, "Voltar"),
            BotaoPrimario(() {
              proximaPagina();
              setTextoPaginaAtual(true);
            }, "Avançar")
          ],
        ),
      ),
    );
  }
  
}

class ContainerServicoAdicionado extends StatefulWidget {

  int codigCategoriaServico;
  Function(ServicoVO) onRegister;

  ContainerServicoAdicionado({required this.codigCategoriaServico, required this.onRegister, super.key});

  @override
  State<ContainerServicoAdicionado> createState() => _ContainerServicoAdicionadoState();
}

class _ContainerServicoAdicionadoState extends State<ContainerServicoAdicionado> {

  late ServicoVO servicoAdicionado;

  @override
  void initState() {
    super.initState();
    servicoAdicionado = ServicoVO();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
      child: Column(
        spacing: 4,
        children: [
          //Nome de cadastro do usuário proprietário
          CampoTexto(valorTexto: "", label: "Nome do Serviço", placeholder: "Nome do seu salão", textoAjudaInferior: "", corTexto: AppColors.preto, erro: false, aviso: false, iconeInicial: null, iconeFinal: null, onTextChange: (valorTexto) {
            servicoAdicionado.setDescricaoServico(valorTexto);
          }),
          CampoTexto(valorTexto: "", label: "Valor do Serviço", placeholder: "RS",textoAjudaInferior: "", corTexto: AppColors.preto,erro: false, aviso: false, iconeInicial: null, iconeFinal: null,onTextChange: (valorTexto) {
            servicoAdicionado.setValor(double.tryParse(valorTexto) ?? 0);
          }),
          CampoTexto(valorTexto: "", label: "Tempo de duração", placeholder: "Exemplo: 1 hora",textoAjudaInferior: "", corTexto: AppColors.preto,erro: false, aviso: false, iconeInicial: null, iconeFinal: null,onTextChange: (valorTexto) {
            servicoAdicionado.setValor(double.tryParse(valorTexto) ?? 0);
          }),
          const Row(),
          Row(
            spacing: 4,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BotaoPrimario(() {
                servicoAdicionado.setIdCategoria(widget.codigCategoriaServico);
                widget.onRegister(servicoAdicionado);
              }, "Adicionar serviço dessa categoria")
            ],
          )
        ],
      ),
    );
  }
}



