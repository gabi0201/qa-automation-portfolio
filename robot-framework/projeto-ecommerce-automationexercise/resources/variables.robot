*** Variables ***
${URL}    https://automationexercise.com/
${EMAIL}       gabrielle.qa@test.com
${SENHA}       123456
${AVISO_LOGADO}     Logged in as Gabrielle
${EMAIL_INCORRETO}    erro@email.com
${SENHA_INCORRETA}     1212
${LOGIN_INVALIDO}    Your email or password is incorrect!
${ADDRESS}    20 W 34th St.
${STATE}    NY
${CITY}     New York
${ZIP_CODE}    10118
${CRIAR_CONTA}      //button[@type='submit'][contains(.,'Create Account')]
${CONTA_CRIADA}    Account Created!
${PAGE_PRODUTOS}    //a[contains(.,' Products')]
${ADICIONADO_AO_CARRINHO}    //h4[@class='modal-title w-100'][contains(.,'Added!')]
${CONTINUE_SHOPPING}    //button[@class='btn btn-success close-modal btn-block'][contains(.,'Continue Shopping')]
${CART}    (//a[@href='/view_cart'][contains(.,'Cart')])[1]
${PLACE_ORDER}    //a[@class='btn btn-default check_out']