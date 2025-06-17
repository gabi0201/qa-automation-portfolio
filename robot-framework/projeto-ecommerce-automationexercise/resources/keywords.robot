*** Settings ***
Library    SeleniumLibrary
Library    Screenshot    screenshot_directory=results/screenshots
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

Gerar dados de cartão fake
    ${card_number}=    Credit Card Number
    ${name}=    Name
    ${cvc}=    Credit Card Security Code
    ${expiry_date}=    Credit Card Expire

    Set Suite Variable    ${CARTAO_NUMERO}    ${card_number}
    Set Suite Variable    ${CARTAO_NOME}      ${name}
    Set Suite Variable    ${CARTAO_CVC}       ${cvc}
    Set Suite Variable    ${CARTAO_EXPIRACAO}    ${expiry_date}

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

Given que acesso a página de Produtos
    Click Element    ${PAGE_PRODUTOS}
    Wait Until Element Is Visible    //h2[contains(@class,'title text-center')]    5s

And visualizo o primeiro produto
    Execute JavaScript    document.querySelector("a[href='/product_details/5']").scrollIntoView({ behavior: 'smooth', block: 'center' })
    Sleep    1s
    Click Element    xpath=//a[@href='/product_details/5']
When adiciono o primeiro produto ao carrinho
    Click Element    //button[@type='button'][contains(.,'Add to cart')]
    Wait Until Element Is Visible    ${ADICIONADO_AO_CARRINHO} 
    Click Element    ${CONTINUE_SHOPPING}

And acesso o carrinho de compras
    Click Element    ${CART}
    
Then vejo o produto no carrinho  
    Page Should Contain    Proceed To Checkout

And clico no botão Proceed To Checkout
    Click Element    //a[@class='btn btn-default check_out'][contains(.,'Proceed To Checkout')]

And confirmo o endereço de entrega
    Page Should Contain    Address Details
    Click Element    //a[contains(@class,'btn btn-default check_out')]

And preencho os dados do pagamento
    Page Should Contain    Payment
    Input Text    //input[@class='form-control']    ${CARTAO_NOME}
    Input Text    //input[contains(@name,'card_number')]    ${CARTAO_NUMERO}
    Input Text    //input[contains(@name,'cvc')]    ${CARTAO_CVC}
    Input Text    //input[@name='expiry_month']    12
    Input Text    //input[@name='expiry_year']    2027
    Click Button    //button[@data-qa='pay-button']

Then vejo a mensagem de sucesso da finalização do pedido     
    Wait Until Page Contains    Congratulations! Your order has been confirmed!    timeout=10s    
    Take Screenshot