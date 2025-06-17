*** Settings ***

Library    SeleniumLibrary
Resource   ../resources/keywords.robot
Resource    ../resources/variables.robot

Suite Setup    Abrir navegador
Suite Teardown    Fechar navegador

*** Test Cases ***
Login com dados válidos
    [Documentation]    Teste de login funcional com usuário válido.
    [Tags]    login_positivo
    Given que estou na página de login
    When informo email e senha corretos 
    And clico no botão de login 
    Then vejo o nome do usuário logado no menu 