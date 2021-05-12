feature 'user sign in' do
    scenario 'a signed up user can sign in' do
        sign_up_and_sign_in
        
        #expect(page).to have_content ('Welcome to Chitter jojobrigs')
        expect(page).not_to have_link 'Sign Up'
        expect(page).not_to have_link 'Sign In'
    end

    scenario 'a user sees an error if they try to sign in with an incorrecrt unsername' do
        User.create(name: 'Joanna', username: 'jojobrigs', email: 'test@test.com', password: 'password123')

        visit '/sessions/new'
        fill_in(:username, with: 'nottherightusername')
        fill_in(:password, with: 'password123')
        click_button('Get Peeping')
    
        #expect(page).not_to have_content 'Welcome, test@example.com'
        expect(page).to have_content 'Please check your username or password'
    end
end


