enum LoginEnum {

  EMAIL_SENHA_PENDENTES(1,"Email e senha não informados",false,false),
  SENHA_PENDENTE(2,"Senha não informada",true,false),
  EMAIL_PENDENTE(3,"Email não informado",false,true),
  SENHA_INCORRETA(4,"Senha incorreta",true,false),
  EMAIL_INVALIDO(5,"Nenhum usuário identificado com esse email",false,false),
  LOGIN_CORRETO(6,"Login correto",true,true);

  final int codigo;
  final String descricao;
  final bool emailValido;
  final bool senhaValida;

  const LoginEnum(this.codigo,this.descricao, this.emailValido, this.senhaValida);

}