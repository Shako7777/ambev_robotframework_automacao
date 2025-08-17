*** Settings ***
Resource    ../resources/frontend_keywords.robot
Suite Setup    Abrir Navegador
Suite Teardown    Fechar Navegador

*** Test Cases ***
Cadastro de novo usuario com sucesso
    Ir Para Pagina Cadastro
    Preencher Campos Cadastro
    Selecionar Checkbox Administrador
    Clicar Botao Cadastrar
    Validar Mensagem Sucesso Cadastro

Login com usuario cadastrado
    Ir Para Pagina Login
    Preencher Campos Login
    Clicar Botao Entrar
    Validar Mensagem Bem Vindo

Excluir proprio usuario
    Ir Para Pagina Login
    Preencher Campos Login
    Clicar Botao Entrar
    Validar Mensagem Bem Vindo
    Clicar Aba Listar Usuarios
    Excluir Proprio Usuario
    Validar Mensagem Nao Excluir Proprio Usuario
