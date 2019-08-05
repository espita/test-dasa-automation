# frozen_string_literal: true

Given('I acess the sign up') do
  @home = Home.new
  @authentication = Authentication.new

  @home.load
  @home.sign_in.click
  @authentication.submit_create
end

When('that I register a new user') do
  @create_account = Signup_Form.new

  @create_account.imput_data
  @create_account.submit_form
  @create_account.validation_signup
end

Given('I search a product') do
  @search = Home.new.search_product
end

When('I select a product') do
  @item = ItemTShirtPage.new
  @item.item_hover.click

  if BROWSER.eql?('chrome')
    @item.wait_until_item_visible
    @item.wait_until_item_hover_visible
    @item.item_hover.click
    @item.item.click
  end
end

When('Add to cart') do
  @checkout_cart = CheckoutAddToCart.new

  @checkout_cart.cart_button
  @checkout_cart.checkout_button
end

When('fill in check out information') do
  @checkout_summary = CheckoutAddToCart.new
  @checkout_address = CheckoutAddress.new
  @checkout_shipping = CheckoutShipping.new

  @checkout_summary.checkout_button
  @checkout_address.proceed_to_checkout.click
  @checkout_shipping.checker_terms.click
  @checkout_shipping.proceed_to_checkout.click
end

Then('I finish checkout process') do
  @checkout_payment = CheckoutPayment.new

  @checkout_payment.pay_by_bank.click
  @checkout_payment.confirm_my_order.click
end

Then('I see you a message success') do |table|
  @msg_confirm = CheckoutPayment.new.text_confirm_payment.text
  expect("#{@msg_confirm}").to eq(table.hashes[0]['Message confirmation'])
end
