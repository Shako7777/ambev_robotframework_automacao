Feature: Cadastro de usuário

@cadastro
  Scenario: Cadastro de novo usuário com sucesso
    Given que estou na página de cadastro
    When eu preencho os campos obrigatórios
    And seleciono checkbox para Cadastrar como admistrador
    And clico no botão Cadastrar
    Then eu vejo a mensagem de sucesso "Cadastro realizado com sucesso"

# Cenários abaixo só podem ser executados após o Scenario: Cadastro de novo usuário com sucesso
# Ou com um usuário que tenha sido cadastrado anteriormente
@loginusuariocadastrado
  Scenario: Login com usuário cadastrado
    Given que estou na página de login
    When eu preencho os campos obrigatórios de login
    And clico em Entrar
    Then sou redirecionado para a página inicial    
  
@excluirpropriousuario
  Scenario: Excluir próprio usuário
    Given realizo o login
    And clico na aba Listar Usuários 
    When clico em excluir meu próprio usuário
    Then eu vejo a mensagem "Não é possível excluir o próprio usuário!" 