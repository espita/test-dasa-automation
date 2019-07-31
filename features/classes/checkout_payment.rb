class CheckoutPayment < SitePrism::Page
    element :pay_by_bank, ".bankwire"
    element :confirm_my_order, ".icon-chevron-right"
    element :text_confirm_payment, ".cheque-indent"
  end