*** Settings ***
Library         SeleniumLibrary
Library         String
Resource        ../pages/frontend_page.robot
Suite Setup     Abrir Navegador
Suite Teardown  Fechar Navegador

*** Keywords ***
Abrir Navegador
    Open Browser    ${BASE_URL}    chrome
    Maximize Browser Window

Fechar Navegador
    Close Browser

Ir Para Pagina Cadastro
    Go To    ${BASE_URL}/cadastrarusuarios

Ir Para Pagina Login
    Go To    ${BASE_URL}/login

Preencher Campos Cadastro
    Input Text    ${CAMPO_NOME}    ${nome}
    Input Text    ${CAMPO_EMAIL}   caio.santos@ambev.com.br
    Input Text    ${CAMPO_SENHA_CADASTRO}    caioambev1988

Selecionar Checkbox Administrador
    Click Element    ${CHECKBOX_ADMIN}

Clicar Botao Cadastrar
    Click Element    ${BOTAO_CADASTRAR}

Validar Mensagem Sucesso Cadastro
    Wait Until Element Is Visible    ${MENSAGEM_SUCESSO_CADASTRO}    10s
    Capture Page Screenshot    Cadastro_sucesso.png

Preencher Campos Login
    Input Text    ${CAMPO_EMAIL}    caio.santos@ambev.com.br
    Input Text    ${CAMPO_SENHA_LOGIN}    caioambev1988

Clicar Botao Entrar
    Click Element    ${BOTAO_ENTRAR}

Validar Mensagem Bem Vindo
    Wait Until Element Is Visible    ${MENSAGEM_BEM_VINDO}    10s
    Capture Page Screenshot    Login_sucesso.png

Clicar Aba Listar Usuarios
    Click Element    ${ABA_LISTAR_USUARIOS}

Excluir Proprio Usuario
    Wait Until Element Is Visible    //table/tbody    30s
    Wait Until Element Is Visible    //table/tbody/tr    10s
    
    ${linhas}=    Get WebElements    //table/tbody/tr
    ${usuario_procurado}=    Set Variable    ${nome}
    ${linha_encontrada}=    Set Variable    ${0}
    
    ${linhas_count}=    Get Length    ${linhas}
    FOR    ${i}    IN RANGE    1    ${linhas_count}+1
        ${nome}=    Get Text    //table/tbody/tr[${i}]/td[1]
        ${nome_lower}=    Convert To Lowercase    ${nome}
        ${usuario_lower}=    Convert To Lowercase    ${usuario_procurado}
        ${contem_usuario}=    Run Keyword And Return Status    Should Contain    ${nome_lower}    ${usuario_lower}
        Run Keyword If    ${contem_usuario}    Set Suite Variable    ${linha_encontrada}    ${i}
        Exit For Loop If    ${contem_usuario}
    END
    
    Run Keyword If    ${linha_encontrada} == 0    Fail    Usuário '${usuario_procurado}' não encontrado
    Log    Usuário '${usuario_procurado}' encontrado na linha ${linha_encontrada}
    
    ${botao_excluir_xpath}=    Set Variable    //table/tbody/tr[${linha_encontrada}]/td[5]/div/button[2]
    Wait Until Element Is Visible    ${botao_excluir_xpath}    10s
    Click Element    ${botao_excluir_xpath}
    Click Element    ${botao_excluir_xpath}

Validar Mensagem Nao Excluir Proprio Usuario
    Wait Until Element Is Visible    ${MENSAGEM_NAO_EXCLUIR_PROPRIO_USUARIO}    10s
    Mouse Over    ${MENSAGEM_NAO_EXCLUIR_PROPRIO_USUARIO}
    Sleep    1s
    Capture Page Screenshot    Excluir_erro.png
