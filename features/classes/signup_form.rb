# Sign Up
class Signup_Form < SitePrism::Page
    element :create_account_button, '#SubmitCreate'
    element :my_title, 'label[for="id_gender1"]'
    element :my_first_name, '#customer_firstname'
    element :my_last_name, '#customer_lastname'
    element :my_password, '#passwd'
    element :my_day_of_birth, '#uniform-days'
    element :my_month_of_birth, '#uniform-months'
    element :my_year_of_birth, '#uniform-years'
    element :my_address_first_name, '#firstname'
    element :my_address_last_name, '#lastname'
    element :my_address, '#address1'
    element :my_city, '#city'
    element :my_state, '#uniform-id_state'
    element :my_zip, '#postcode'
    element :my_mobile_phone, '#phone_mobile'
    element :register_button, '#submitAccount'

    def initialize
        @signup_data = DEFAULT_DATA['signup']
        @first_name = Faker::Name.first_name
        @last_name = Faker::Name.last_name
    end

    def imput_data
        wait_page_form_load
        my_title.click
        my_first_name.set(@first_name)
        my_last_name.set(@last_name)
        my_password.set @signup_data["password"]
        my_address.set(Faker::Address.street_address)
        my_city.set(Faker::Address.city)
        my_state.select @signup_data["state"]
        my_zip.set @signup_data["zip"]
        my_mobile_phone.set @signup_data["phone-mobile"]
        my_day_of_birth.select @signup_data["day-birth"]
        my_month_of_birth.select @signup_data["month-birth"]
        my_year_of_birth.select @signup_data["year-birth"]
        my_address_first_name.set(@first_name)
        my_address_last_name.set(@last_name)
    end
    
    def submit_form
        register_button.click
    end

    def validation_signup
        @user_name = @first_name + " " + @last_name
        within (".account") do
          page.has_content?(@user_name)	
        end
    end

    def wait_page_form_load
        wait_until_my_day_of_birth_visible
        wait_until_my_month_of_birth_visible
        wait_until_my_year_of_birth_visible
    end
end