class CheckoutAddToCart < SitePrism::Page

    element :add_to_cart, 'button[name="Submit"]'
    element :proceed_to_checkout, 'a[title="Proceed to checkout"]'
    
    def cart_button
        wait_until_add_to_cart_visible
        add_to_cart.click
    end
    
    def checkout_button
        wait_until_proceed_to_checkout_visible
        proceed_to_checkout.click        
    end
    
end