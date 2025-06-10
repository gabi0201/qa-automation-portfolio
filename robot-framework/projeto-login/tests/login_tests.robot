*** Settings ***
Resource    ../resources/login_keywords.robot
Documentation    Testes de Login

*** Test Cases ***
Login com Credenciais Válidas
    Abrir Navegador
    Preencher Credenciais     tomsmith     SuperSecretPassword!
    Clicar em Login
    Verificar Login com Sucesso
    [Teardown]     Fechar Navegador