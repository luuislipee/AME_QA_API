@management
Feature: Cadastro de Usuário
  Para que eu possa gerenciar os usuários no sistema
  Sendo um gestor do sistema
  Posso cadastrar um novo usuário

  @new_user
  Scenario Outline: Criar novo usuário
  Um gestor do sistema cadastra um novo usuário através da API,
  e um novo usuário é cadastrado no sistema

    Given the API address
    When I register a new user with the following data:
      | id         | <id>        |
      | name       | <name>      |
      | salary     | <salary>    |
      | age        | <age>       |
    Then the system should create a new user

    Examples: 
    | id  | name            | salary | age | 
    | 12  | Lewis Hamilton  | 100000 | 30  |

@delete_user
  Scenario Outline: Deletar Usuário
  Um gestor do sistema deve ser capaz de deletar um usuário,
  passando o ID dele para a API

    Given the API address
    When I pass the <id> as parameter for deletion
    Then the user should be deleted

    Examples:
    | id | 
    |  1 | 
