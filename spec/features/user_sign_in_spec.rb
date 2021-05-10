feature 'a signed up user can sign in' do
    scenario ' a user can sign in' do
        sign_up_and_sign_in
        
        
        #expect(page).to have_content ('Welcome to Chitter jojobrigs')
        expect(page).not_to have_link 'Sign Up'
        expect(page).not_to have_link 'Sign In'

    end
end


