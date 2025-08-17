*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    DateTime

*** Keywords ***
Salvar Evidencia
    [Arguments]    ${nome_cenario}
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    ${nome_arquivo}=    Catenate    SEPARATOR=_    Scenario_${nome_cenario}    ${timestamp}.png
    ${caminho}=    Join Path    ${CURDIR}    ${nome_arquivo}
    Capture Page Screenshot    ${caminho}
    Log To Console    Screenshot salvo em: ${caminho}
