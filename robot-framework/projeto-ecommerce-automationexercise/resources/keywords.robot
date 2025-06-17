*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/variables.robot

*** Keywords ***
Abrir navegador
    Open Browser    ${URL}    ff
    Maximize Browser Window

Fechar navegador
    Close Browser

Given que estou na página de login
    Click Element    //a[contains(.,'Signup / Login')]

When informo email e senha corretos
    Input Text    //input[contains(@data-qa,'login-email')]    ${EMAIL}
    Input Text    //input[@type='password']   ${SENHA} 

And clico no botão de login
    Click Button    //button[contains(.,'Login')]

Then vejo o nome do usuário logado no menu
    Page Should Contain    ${AVISO_LOGADO} 