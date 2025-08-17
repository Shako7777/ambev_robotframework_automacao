*** Settings ***
Library           RequestsLibrary
Resource          ../resources/serverest_keywords.robot
Suite Setup       Criar Sessao API

*** Variables ***
${BASE_URL}       https://serverest.dev

*** Test Cases ***
Cadastrar usuário com sucesso
    [Tags]    cadastro_usuario_sucesso
    ${response}=    Criar Usuário
    ${json}=    Set Variable    ${response.json()}
    ${user_id}=    Get From Dictionary    ${json}    _id
    Set Suite Variable    ${USER_ID}    ${user_id}
    Valida Status Code    ${response}    201
    Valida Campo Na Resposta    ${response}    message    Cadastro realizado com sucesso

Cadastrar usuário com email já existente
    [Tags]    cadastro_usuario_existente
    ${response}=    Criar Usuário    expected_status=400
    Valida Status Code    ${response}    400
    Valida Campo Erro Na Resposta    ${response}    message    Este email já está sendo usado

Excluir usuário com sucesso
    [Tags]    excluir_usuario_sucesso
    ${delete_response}=    Delete Usuario    ${USER_ID}
    Valida Status Code    ${delete_response}    200
    Valida Campo Na Resposta    ${delete_response}    message    Registro excluído com sucesso
