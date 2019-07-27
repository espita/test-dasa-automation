
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
