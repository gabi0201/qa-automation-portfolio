*** Settings ***

Library    SeleniumLibrary
Library    FakerLibrary
Resource   ../resources/keywords.robot
Resource    ../resources/variables.robot

Test Teardown    Fechar navegador
Test Setup      Abrir navegador

*** Test Cases ***

Fluxo completo de compra com novo usuário 
    [Documentation]    Teste ponta-a-ponta: cadastro, adicionar produto, checkout e finalização de pedido.
    [Tags]    fluxo_completo    e2e    positivo

    Gerar dados dinâmicos para cadastro
    Given que estou na página de cadastro
    When preencho os dados obrigatórios corretamente
    And clico no botão de criar conta
    Then vejo a mensagem de sucesso confirmando o cadastro

    Gerar dados de cartão fake
    Given que acesso a página de Produtos 
    And visualizo o primeiro produto 
    When adiciono o primeiro produto ao carrinho 
    And acesso o carrinho de compras 
    Then vejo o produto no carrinho  
    And clico no botão Proceed To Checkout 
    And confirmo o endereço de entrega 
    And preencho os dados do pagamento
    Then vejo a mensagem de sucesso da finalização do pedido      