*** Settings ***
Library    SeleniumLibrary
Library    Screenshot
Library    FakerLibrary
Resource    ../resources/variables.robot

*** Keywords ***

Gerar dados dinâmicos para cadastro
    ${first_name}=     First Name
    ${last_name}=      Last Name
    ${email}=          Email
    ${senha}=          Password
    ${telefone}=       Phone Number

    Set Suite Variable    ${FIRST_NAME}     ${first_name}
    Set Suite Variable    ${LAST_NAME}      ${last_name}
    Set Suite Variable    ${EMAIL_NOVO}     ${email}
    Set Suite Variable    ${NEW_PASSWORD}   ${senha}
    Set Suite Variable    ${PHONE_NUMBER}   ${telefone}

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
    Select From List By Label    //select[contains(@data-qa,'country')]    India
    Input Text    //input[contains(@data-qa,'state')]    ${STATE}
    Input Text    //input[contains(@data-qa,'city')]    ${CITY}
    Input Text    //input[contains(@data-qa,'zipcode')]   ${ZIP_CODE}
    Input Text    //input[@type='text'][contains(@id,'number')]    ${PHONE_NUMBER}

And clico no botão de criar conta
    Wait Until Element Is Visible    ${CRIAR_CONTA}    10s
    Execute Javascript    document.querySelector("button[type='submit']").click()

Then vejo a mensagem de sucesso confirmando o cadastro
    Wait Until Page Contains    Account Created!    timeout=10s  
    Page Should Contain    Account Created! 
    Take Screenshot