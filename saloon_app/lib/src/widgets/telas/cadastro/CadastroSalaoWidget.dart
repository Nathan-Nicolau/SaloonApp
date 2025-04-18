import 'package:flutter/material.dart';
import 'package:saloon_app/src/enums/CategoriaServicoEnum.dart';
import 'package:saloon_app/src/enums/DiasSemanaEnum.dart';
import 'package:saloon_app/src/model/vo/CategoriaServicoVO.dart';
import 'package:saloon_app/src/model/vo/ConfirmacaoCadastroVO.dart';
import 'package:saloon_app/src/model/vo/DiaSemanaVO.dart';
import 'package:saloon_app/src/model/vo/HorarioFuncionamentoCompletoVO.dart';
import 'package:saloon_app/src/model/vo/ProprietarioSalaoVO.dart';
import 'package:saloon_app/src/model/vo/SalaoVO.dart';
import 'package:saloon_app/src/model/vo/ServicoVO.dart';
import 'package:saloon_app/src/model/vo/UsuarioVO.dart';
import 'package:saloon_app/src/utils/AppUtils.dart';
import 'package:saloon_app/src/utils/UtilsUI.dart';
import 'package:saloon_app/src/widgets/BotaoPrimario.dart';
import 'package:saloon_app/src/widgets/Texto.dart';
import 'package:saloon_app/src/widgets/dialog/DialogMensagem.dart';
import 'package:saloon_app/src/widgets/telas/cadastro/abas_cadastro_salao/AbaCadastroHorarios.dart';
import 'package:saloon_app/src/widgets/telas/cadastro/abas_cadastro_salao/AbaCadastroServicos.dart';
import 'package:saloon_app/src/widgets/telas/cadastro/abas_cadastro_salao/AbaServicosCadastrados.dart';
import 'package:toastification/toastification.dart';
import '../../../telas/ConfirmacaoCadastroSalaoScreen.dart';
import '../../../utils/AppColors.dart';
import '../../CampoTexto.dart';
import 'abas_cadastro_salao/AbaCadastroUsuario.dart';

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
  bool erroConfirmacaoSenha = false;

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
    usuario = UsuarioVO();
    salao = SalaoVO();
    servicoAdicionado = ServicoVO();
    listaCategoriasBase = CategoriaServicoEnum.getCategoriasBase();
    listaCategoriasSelecionadas = [];
    listaAbasCategorias = [];
    tabController = TabController(length: 6, vsync: this);
    listaServicosTotais = [];
    listaDiasSemanaBase = DiasSemanaEnum.getListaSemana();
    listaDiasSemanaSelecionados = [];
    horarioFuncionamentoCompletoVO = HorarioFuncionamentoCompletoVO();
  }

  void setNomeUsuario(String nome) {
    setState(() {
      usuario.setNomeUsuario(nome);
    });
  }

  void setEmailUsuario(String emailUsuario) {
    setState(() {
      usuario.setEmailUsuario(emailUsuario);
    });
  }

  void setTelefoneUsuario(String telefoneUsuario) {
    setState(() {
      usuario.setTelefoneUsuario(telefoneUsuario);
    });
  }

  void setSenhaUsuario(String senhaUsuario) {
    setState(() {
      usuario.setSenhaUsuario(senhaUsuario);
    });
  }

  void setConfirmacaoSenha(String confirmacaoSenha) {
    setState(() {
      usuario.setConfirmacaoSenha(confirmacaoSenha);
    });
  }

  void setErroConfirmacaoSenha() {
    setState(() {
      bool senhaInformada = usuario.getSenhausuario() != null;
      bool confirmacaoSenhaInformada = usuario.getConfirmacaoSenha() != null;
      erroConfirmacaoSenha = (
          usuario.getSenhausuario() != usuario.getConfirmacaoSenha() &&
      senhaInformada && confirmacaoSenhaInformada);
    });
  }

  void setTextoPaginaAtual(bool proximo) {
    setState(() {
      if(proximo) {
        textoPagina == pagina + 1;
      } else {
        textoPagina = textoPagina - pagina;
      }
    });
    validarTituloAppbar();
  }

  bool validarPermissaoConfirmacao() {

    bool permite = true;

    bool nomeInformado = usuario.getNomeUsuario() != null;
    bool emailUsuarioInformado = usuario.getEmailUsuario() != null;
    bool telefoneInformado = usuario.getTelefoneUsuario() != null;
    bool senhaInformada = usuario.getSenhausuario() != null;

    bool nomeEstabelecimentoInformado = salao.getNomeSalao() != null;
    bool cepEstabelecimento = salao.getCepSalao() != null;
    bool enderecoEstabelecimento = salao.getEnderecoSalao() != null;
    bool numeroEnderecoInformado = salao.getNumeroEndereco() != null;

    bool umaCategoriaSelecionada = cabeloMasculino || cabeloFeminino || depilacao || maquiagem || manicure || outros;
    bool umServicoInformado = listaServicosTotais.isNotEmpty;
    bool horariosInformados = horarioFuncionamentoCompletoVO.isHorariosAtribuidosCorretamente();

    permite = umaCategoriaSelecionada && umServicoInformado && horariosInformados;

    if(!nomeInformado || !emailUsuarioInformado || !telefoneInformado || !senhaInformada) {
      UtilsUI.showToast(context,"Informações do usuário incompletas");
    } else if(!nomeEstabelecimentoInformado || !cepEstabelecimento || !!enderecoEstabelecimento || numeroEnderecoInformado) {
      UtilsUI.showToast(context,"Informações do estabelecimento incompletas");
    } else if(!umaCategoriaSelecionada) {
      UtilsUI.showToast(context,"Selecione ao menos uma categoria");
    } else if (!umServicoInformado) {
      UtilsUI.showToast(context,"É necessário que você informe ao menos um serviço");
    } else if(!horariosInformados) {
      UtilsUI.showToast(context,"É necessário informar ao menos um horário");
    }

    return permite;
  }

  void proximaPagina() {
    setState(() {

      if(pagina == 5 && validarPermissaoConfirmacao()) {
        prosseguirConfirmacaoCadastro();
      }

      if(pagina < 5) {
        pagina++;
        validarTituloAppbar();
      }
    });
  }

  void paginaAnterior() {
    setState(() {
      if(pagina > 0) {
        pagina--;
        validarTituloAppbar();
      }
    });
  }

  void validarTituloAppbar() {
    setState(() {
      var paginaSelecionada = pagina + 1;
      switch(paginaSelecionada) {
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
        listaServicosTotais.add(novoServico);
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

  void adicionarDiaSemanaNaSuaLista(DiaSemanaVO diaSemana) {
    listaDiasSemanaSelecionados.add(diaSemana);
  }

  void removerServico(ServicoVO servicoParaRemover) {
    setState(() {
      listaServicosTotais.remove(servicoParaRemover);
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

  //Essa função deve ser chamada quando o cadatro estiver pronto para ser finalizado
  void prosseguirConfirmacaoCadastro() {
    setState(() {
      var proprietarioSalao = ProprietarioVO();
      proprietarioSalao.setNomeProprietario(usuario.getNomeUsuario() ?? "");
      proprietarioSalao.setDataCadastroProprietario(AppUtils.getDataAtualFormatada());
      salao.setProprietarioVo(proprietarioSalao);
      salao.setHorarioFuncionamento(horarioFuncionamentoCompletoVO);
      ConfirmacaoCadastroVO confirmacaoCadastroVO = ConfirmacaoCadastroVO();
      confirmacaoCadastroVO.setSalao(salao);
      confirmacaoCadastroVO.setUsuario(usuario);
      prosseguirTelaConfirmacaoCadastro(confirmacaoCadastroVO);
    });
  }

  void prosseguirTelaConfirmacaoCadastro(ConfirmacaoCadastroVO confirmacaoCadastro) {
    Navigator.pushNamed(context, ConfirmacaoCadastroScreen.routeName, arguments: confirmacaoCadastro);
  }

  @override
  Widget build(BuildContext context) {

    //Lista de telas construídas aqui
    List<Widget> telas = [
      //Primeira página - Acesso
      AbaCadastroUsuario(
        usuario: usuario,
        setNomeUsuario: setNomeUsuario,
        setEmailUsuario: setEmailUsuario,
        setTelefoneUsuario: setTelefoneUsuario,
        setSenhaUsuario: setSenhaUsuario,
        setConfirmacaoSenha: setConfirmacaoSenha,
      ),
      //Segunda página - Informações do local
      Container(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
        child: Column(
            spacing: 8,
            children: [
              //Nome de cadastro do usuário proprietário
              CampoTexto(valorTexto: "", label: "Nome do estabelecimento", placeholder: "Nome do seu salão", textoAjudaInferior: "", corTexto: AppColors.preto, erro: false, aviso: false, iconeInicial: null, iconeFinal: null, onTextChange: (valorTexto) {
                setState(() {
                  salao.setNomeSalao(valorTexto);
                });
              }),
              CampoTexto(valorTexto: "", label: "CEP", placeholder: "Digite apenas os números", textoAjudaInferior: "", corTexto: AppColors.preto, erro: false, aviso: false, iconeInicial: null, iconeFinal: null, onTextChange: (valorTexto) {
                setState(() {
                  salao.setCepEndereco(valorTexto);
                });
              }),
              CampoTexto(valorTexto: "", label: "Endereço", placeholder: "Endereço do local", textoAjudaInferior: "", corTexto: AppColors.preto, erro: false, aviso: false, iconeInicial: null, iconeFinal: null, onTextChange: (valorTexto) {
                setState(() {
                  salao.setEnderecoSalao(valorTexto);
                });
              }),
              CampoTexto(valorTexto: "", label: "Número", placeholder: "Do endereço", textoAjudaInferior: "", corTexto: AppColors.preto, erro: false, aviso: false, iconeInicial: null, iconeFinal: null, onTextChange: (valorTexto) {
                setState(() {
                  salao.setNumeroEndereco(valorTexto);
                });
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
      AbasCadastroServicos(
          listaCategoriasSelecionadas: listaCategoriasSelecionadas,
          cabeloMasculino: cabeloMasculino, cabeloFeminino: cabeloFeminino,
          depilacao: depilacao,
          manicure: manicure,
          maquiagem: maquiagem,
          outros: outros,
          cadastrarNovoServico: cadastrarNovoServico),
      //Quinta página - Serviços adicionados
      AbaServicosCadastrados(listaServicosCadastrados: listaServicosTotais, removerServico: removerServico),
      //Sexta página - Horário funcionamento
      AbaCadastroHorarios(
          //Essa função é chamada sempre que um campos dos horários é atualizado
          setHorario: (horarioEditado) {
        setState(() {
          switch(horarioEditado.getDiaSemanaEnum()!) {
            case DiasSemanaEnum.SEGUNDA_FEIRA:
              horarioFuncionamentoCompletoVO.setHorarioSegunda(horarioEditado);
              break;
            case DiasSemanaEnum.TERCA_FEIRA:
              horarioFuncionamentoCompletoVO.setHorarioTerca(horarioEditado);
              break;
            case DiasSemanaEnum.QUARTA_FEIRA:
              horarioFuncionamentoCompletoVO.setHorarioQuarta(horarioEditado);
              break;
            case DiasSemanaEnum.QUINTA_FEIRA:
              horarioFuncionamentoCompletoVO.setHorarioQuinta(horarioEditado);
              break;
            case DiasSemanaEnum.SEXTA_FEIRA:
              horarioFuncionamentoCompletoVO.setHorarioSexta(horarioEditado);
              break;
            case DiasSemanaEnum.SABADO:
              horarioFuncionamentoCompletoVO.setHorarioSabado(horarioEditado);
              break;
            case DiasSemanaEnum.DOMINGO:
              horarioFuncionamentoCompletoVO.setHorarioDomingo(horarioEditado);
              break;
          }
        });
      })
    ];

    return Scaffold(
      appBar: AppBar(
        title: Texto(texto: tituloAppBar, tamanhoTexto: 18, peso: FontWeight.bold, cor: AppColors.preto),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
            child: Texto(texto: "${pagina + 1}/6", tamanhoTexto: 16, peso: FontWeight.w600, cor: AppColors.preto)
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
            }, textoBotao: "Voltar"),
            BotaoPrimario(onPressed: () {
              proximaPagina();
            }, textoBotao: pagina == 5 ? "Finalizar" : "Avançar")
          ],
        ),
      ),
    );
  }

}
