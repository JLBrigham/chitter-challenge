feature 'user authentication' do
    scenario 'a signed up user can sign in' do
        sign_up_and_sign_in
        
        expect(page).to have_content ('Welcome to Chitter jojobrigs')
        expect(page).not_to have_link 'Sign Up'
        expect(page).not_to have_link 'Sign In'
    end

    scenario 'a user sees an error if they try to sign in with an incorrect username' do
        sign_up
        
        click_link('Sign In')
        fill_in(:username, with: 'nottherightusername')
        fill_in(:password, with: 'password123')
        click_button('Get Peeping')
    
        expect(page).not_to have_content 'Welcome to Chitter jojobrigs'
        expect(page).to have_content 'Please check your username or password'
    end

    scenario 'a user sees an error if they try to sign in with an incorrect password' do
        sign_up

        click_link('Sign In')
        fill_in(:username, with: 'jojobrigs')
        fill_in(:password, with: 'nottherightpassword')
        click_button('Get Peeping')

        expect(page).not_to have_content 'Welcome to Chitter jojobrigs'
        expect(page).to have_content 'Please check your username or password'
    end

end


