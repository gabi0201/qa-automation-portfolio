*** Settings ***
Library    SeleniumLibrary
Library    Screenshot
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
    Take Screenshot

When informo email e senha inválidos
    Input Text    //input[contains(@data-qa,'login-email')]    ${EMAIL_INCORRETO}
    Input Text    //input[@type='password']   ${SENHA_INCORRETA}
Then vejo a mensagem de erro de login
    Page Should Contain    ${LOGIN_INVALIDO}
    Take Screenshot