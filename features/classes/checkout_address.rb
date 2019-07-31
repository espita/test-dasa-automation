# frozen_string_literal: true

class CheckoutAddress < SitePrism::Page
  element :proceed_to_checkout, 'button[name="processAddress"]'
  end
