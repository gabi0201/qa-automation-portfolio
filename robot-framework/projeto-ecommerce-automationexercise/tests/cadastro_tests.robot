*** Settings ***

Library    SeleniumLibrary
Library    FakerLibrary
Resource   ../resources/keywords.robot
Resource    ../resources/variables.robot

Test Teardown    Fechar navegador
Test Setup      Abrir navegador

*** Test Cases ***

Cadastro de novo usuário
    [Documentation]    Deve permitir o cadastro de um novo usuário com dados válidos.
    [Tags]    cadastro    positivo
    Gerar dados dinâmicos para cadastro
    Given que estou na página de cadastro
    When preencho os dados obrigatórios corretamente 
    And clico no botão de criar conta 
    Then vejo a mensagem de sucesso confirmando o cadastro 