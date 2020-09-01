@management
Feature: Cadastro de Usuário
  Para que eu possa gerenciar os usuários no sistema
  Sendo um gestor do sistema
  Posso cadastrar um novo usuário

  @new_user
  Scenario Outline: Criar novo usuário
  Um gestor do sistema cadastra um novo usuário através da API,
  e um novo usuário é cadastrado no sistema

    Given the API "/create"
    When I register a new user with the following data
      | id         | <id>        |
      | name       | <name>      |
      | salary     | <salary>    |
      | age        | <age>       |
    Then the system should create a new user