feature 'user authentication' do
    scenario 'a signed up user can sign in' do
        sign_up_and_sign_in
        
        expect(page).to have_content ('Welcome jojobrigs')
        expect(page).not_to have_link 'Sign Up'
        expect(page).not_to have_link 'Sign In'
    end

    scenario 'a user sees an error if they try to sign in with an incorrect username' do
        sign_up
        
        click_button('Sign In')
        fill_in(:username, with: 'nottherightusername')
        fill_in(:password, with: 'password123')
        click_button('Get Peeping')
    
        expect(page).not_to have_content 'Welcome to Chitter jojobrigs'
        expect(page).to have_content 'Please check your username or password'
    end

    scenario 'a user sees an error if they try to sign in with an incorrect password' do
        sign_up

        click_button('Sign In')
        fill_in(:username, with: 'jojobrigs')
        fill_in(:password, with: 'nottherightpassword')
        click_button('Get Peeping')

        expect(page).not_to have_content 'Welcome to Chitter jojobrigs'
        expect(page).to have_content 'Please check your username or password'
    end

    scenario 'a signed in user can sign out' do
        sign_up_and_sign_in

        click_button('Sign Out')

        expect(page).not_to have_content 'Welcome to Chitter jojobrigs'
        expect(page).to have_content 'You are now logged out, goodbye!'
        expect(page).to have_button('Sign In')
        expect(page).to have_button('Sign Up')
    end

end


