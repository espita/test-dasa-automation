# encoding: utf-8
@create_order

Feature: Purchase follow of a ecommerce 

As a new user
I want to create an e-commerce registration
In order to make a purchase

Background: Register a new user
    Given I acess the sign up 
    When that I register a new user

Scenario: Purchase flow
    Given I search a product 
     When I select a product
     And Add to cart
     And fill in check out information
     Then I finish checkout process
     And I see you a message success
     | Message confirmation                |
     | Your order on My Store is complete. |