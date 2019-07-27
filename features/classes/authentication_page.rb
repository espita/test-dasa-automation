class Authentication < SitePrism::Page

    element :email, '#email_create'
    element :create_an_acount, '#SubmitCreate'

    def submit_create
    email.set(Faker::Internet.email)
    create_an_acount.click
    end

end