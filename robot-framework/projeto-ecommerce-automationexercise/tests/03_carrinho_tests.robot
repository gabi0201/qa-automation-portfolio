*** Settings ***

Library    SeleniumLibrary
Library    FakerLibrary
Resource   ../resources/keywords.robot
Resource    ../resources/variables.robot

Test Teardown    Fechar navegador
Test Setup      Abrir navegador

*** Test Cases ***

Adicionar produto ao carrinho
    [Documentation]    Deve permitir adicionar um produto ao carrinho e visualizar no carrinho.
    [Tags]    carrinho    positivo
    Given que acesso a página de Produtos 
    And visualizo o primeiro produto 
    When adiciono o primeiro produto ao carrinho 
    And acesso o carrinho de compras 
    Then vejo o produto no carrinho     