*** Settings ***

Library    SeleniumLibrary
Resource   ../resources/keywords.robot
Resource    ../resources/variables.robot

Test Teardown    Fechar navegador
Test Setup      Abrir navegador

*** Test Cases ***
Login com dados válidos
    [Documentation]    Teste de login funcional com usuário válido.
    [Tags]    login_positivo
    Given que estou na página de login
    When informo email e senha corretos 
    And clico no botão de login 
    Then vejo o nome do usuário logado no menu 

Login com dados inválidos
    [Documentation]    Deve exibir erro ao tentar logar com email/senha incorretos.
    [Tags]    login_negativo
    Given que estou na página de login
    When informo email e senha inválidos 
    And clico no botão de login
    Then vejo a mensagem de erro de login 
    