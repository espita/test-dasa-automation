
Given("I acess the sign up") do
    @home = Home.new
    @authentication = Authentication.new
    
    @home.load
    @home.sign_in.click
    @authentication.submit_create
end

When("that I register a new user") do
    @create_account = Signup_Form.new
    @create_account.imput_data
    @create_account.submit_form
    @create_account.validation_signup
end

Given("I search a product") do
    @search = Home.new
    @search.search_product
  end
  
  When("I select a product") do
    @item = ItemTShirt.new
    @item.item_hover.click

    if BROWSER.eql?('chrome')
      @item.wait_until_item_visible
      @item.wait_until_item_hover_visible
      @item.item_hover.click
      @item.item.click
    end
    
  end
  
  When("Add to cart") do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  When("fill in check out information") do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Then("I finish checkout process") do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Then("I see you a message success") do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  