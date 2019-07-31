class CheckoutShipping < SitePrism::Page
    element :checker_terms, '#uniform-cgv'
    element :proceed_to_checkout, 'button[name="processCarrier"]'
  end