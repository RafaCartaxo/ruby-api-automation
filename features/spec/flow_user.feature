#language: pt
@flow_user
Funcionalidade: Flow User

  @valid_user
  Esquema do Cenario: Realizar cadastro de Usuario
    Dado que tenho dados validos para cadastrar um usuario
    Quando faco uma requisicao do tipo POST para Users com dados validos
    Então devo receber body do usuario cadastrado juntamente com o codigo esperado <codigo_esperado>
    Exemplos:
      | codigo_esperado |
      | 201             |

  @invalid_user
  Esquema do Cenario: Tentar realizar cadastro de Usuario
    Dado que tenho dados invalidos para cadastrar um usuario
    Quando faco uma requisicao do tipo POST para Users com dados invalidos
    Então devo receber response informando erro juntamente com o codigo esperado <codigo_esperado>
    Exemplos:
      | codigo_esperado |
      | 413             |