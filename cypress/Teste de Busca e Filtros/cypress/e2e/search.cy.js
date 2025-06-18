describe('Testes de Busca e Filtros - SauceDemo', () => {

  beforeEach(() => {
    cy.visit('https://www.saucedemo.com/')
    cy.get('[data-test="username"]').type('standard_user')
    cy.get('[data-test="password"]').type('secret_sauce')
    cy.get('[data-test="login-button"]').click()
  })

  it('deve filtrar produtos por menor preço', () => {
    cy.get('.product_sort_container').select('lohi')
    cy.get('.inventory_item_price').first().should('contain', '$7.99')
  })

  it('deve adicionar vários produtos ao carrinho', () => {
    cy.contains('Add to cart').click()
    cy.get('.inventory_item').eq(1).contains('Add to cart').click()
    cy.get('.shopping_cart_badge').should('have.text', '2')
  })

})
