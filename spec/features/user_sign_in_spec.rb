feature 'a signed up user can sign in' do
    scenario ' a user can sign in' do
        sign_up
        click_link('Sign In')
        fill_in('username', with: 'jojobrigs')
        fill_in('password', with: 'password123')
        click_button('Get Peeping')
        
        expect(page).to have_content 'Welcome to Chitter jojobrigs'
        expect(page).not_to have_link 'Sign Up'
        expect(page).not_to have_link 'Sign In'

    end
end


