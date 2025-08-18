*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    BuiltIn
Library    OperatingSystem
Resource   ../variables/endpoints.robot

*** Variables ***
${SESSION}        serverest
${HEADERS}        {"Content-Type": "application/json"}
${BASE_URL}       https://serverest.dev

*** Keywords ***

Ignorar Warning HTTPS
    [Documentation]    Supress warnings de HTTPS
    Run Keyword    Evaluate    urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)    modules=urllib3


Criar Sessao API
    # Cria sessão com headers corretamente
    Ignorar Warning HTTPS
    Create Session    ${SESSION}    ${BASE_URL}    headers=${HEADERS}    verify=False

Criar Usuário
    [Arguments]    ${nome}=${USUARIO_NOME}    ${email}=${USUARIO_EMAIL}    ${password}=${USUARIO_PASSWORD}    ${administrador}=${USUARIO_ADMIN}    ${expected_status}=201
    ${administrador}=    Convert To String    ${administrador}
    ${payload}=    Create Dictionary
    ...    nome=${nome}
    ...    email=${email}
    ...    password=${password}
    ...    administrador=${administrador}
    ${response}=    Post On Session    ${SESSION}    ${USUARIOS}    json=${payload}    expected_status=${expected_status}
    ${json}=    Set Variable    ${response.json()}
    # Salva o ID do usuário para exclusão futura
    Run Keyword If    '_id' in ${json}    Set Suite Variable    ${USER_ID}    ${json}[_id]
    RETURN    ${response}

Valida Status Code
    [Arguments]    ${response}    ${expected_code}
    Should Be Equal As Numbers    ${response.status_code}    ${expected_code}

Valida Campo Na Resposta
    [Arguments]    ${response}    ${campo}    ${valor_esperado}
    ${json}=    Set Variable    ${response.json()}
    Log To Console    Status Code: ${response.status_code}
    Log To Console    Resposta JSON: ${json}
    Dictionary Should Contain Key    ${json}    ${campo}
    ${valor}=    Convert To String    ${json}[${campo}]
    Should Be Equal As Strings       ${valor}    ${valor_esperado}

Valida Campo Erro Na Resposta
    [Arguments]    ${response}    ${campo}    ${valor_esperado}
    ${json}=    Set Variable    ${response.json()}
    Log To Console    Status Code: ${response.status_code}
    Log To Console    Resposta JSON: ${json}
    Dictionary Should Contain Key    ${json}    ${campo}
    ${valor}=    Convert To String    ${json}[${campo}]
    Should Be Equal As Strings       ${valor}    ${valor_esperado}

Delete Usuario
    [Arguments]    ${user_id}=${USER_ID}
    ${response}=    Delete On Session    ${SESSION}    ${USUARIOS}/${user_id}
    ${json}=    Set Variable    ${response.json()}
    RETURN    ${response}
