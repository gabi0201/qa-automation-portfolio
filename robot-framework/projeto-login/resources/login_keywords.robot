*** Settings ***

Library    SeleniumLibrary
Documentation    Keywords reutilizaveis 

*** Variables ***
${URL}     https://the-internet.herokuapp.com/login
${BROWSER}     chrome
${USERNAME_FIELD}     id:username
${PASSWORD_FIELD}     id:password
${LOGIN_BUTTON}     css:button[type='submit']

*** Keywords ***
Abrir navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
Preencher Credenciais
    [Arguments]    ${username}    ${password}
    Input Text    ${USERNAME_FIELD}     ${username}
    Input Password    ${PASSWORD_FIELD}     ${password}
Clicar em Login
    Click Button    ${LOGIN_BUTTON}
Verificar Login com Sucesso
    Wait Until Element Is Visible    //h2[normalize-space()='Secure Area']
Fechar navegador
    Close Browser