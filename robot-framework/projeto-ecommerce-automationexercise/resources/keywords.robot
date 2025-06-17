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

Given que estou na página de cadastro
    Click Element    //a[contains(.,'Signup / Login')]
    Input Text    //input[@type='text']   ${FIRST_NAME}
    Input Text    //input[@data-qa='signup-email']    ${EMAIL_NOVO}
    Click Button    //button[contains(@data-qa,'signup-button')]

When preencho os dados obrigatórios corretamente
    Click Element    //input[@type='radio'][contains(@id,'gender2')]
    Input Password    //input[@type='password']    ${NEW_PASSWORD}
    Input Text    //input[@data-qa='first_name']    ${FIRST_NAME}
    Input Text    //input[contains(@name,'last_name')]    ${LAST_NAME}
    Input Text    //input[@data-qa='address']    ${ADDRESS}
    Click Element    //select[contains(@data-qa,'country')]
    Input Text    //input[contains(@data-qa,'state')]    ${STATE}
    Input Text    //input[contains(@data-qa,'city')]    ${CITY}
    Input Text    //input[contains(@data-qa,'zipcode')]   ${ZIP_CODE}
    Input Text    //input[@type='text'][contains(@id,'number')]    ${PHONE_NUMBER}

And clico no botão de criar conta
    Click Button    ${CRIAR_CONTA} 

Then vejo a mensagem de sucesso confirmando o cadastro
    Page Should Contain    ${CONTA_CRIADA}
    Take Screenshot