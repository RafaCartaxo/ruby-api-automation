#language: pt
@flow_user
Funcionalidade: Flow User

  @valid_user
  Esquema do Cenario: Realizar cadastro de Usuario
    Dado que tenho dados validos para cadastrar um usuario
    Quando faco uma requisicao do tipo POST para Users
    Então devo receber body do usuario cadastrado juntamente com o codigo esperado <codigo_esperado>
    Exemplos:
      | codigo_esperado |
      | 201             |