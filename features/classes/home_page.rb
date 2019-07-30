# frozen_string_literal: true

# Home page
class Home < SitePrism::Page
  set_url 'http://automationpractice.com/index.php'

  element :sign_in, '.login'
  element :search, "input[id='search_query_top']"
  element :search_button, 'button[name="submit_search"]'

  def initialize
    @product_data = DEFAULT_PRODUCT['product']
  end
  
  def search_product
    search.set @product_data["t-shirts"]
    search_button.click    
  end
end
