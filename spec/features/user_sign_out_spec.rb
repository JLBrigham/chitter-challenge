feature 'a user can sign out' do
    scenario 'a signed in user can sign out' do
        sign_up_and_sign_in
        click_link 'Sign Out'

        expect(page).to have_link('Sign In')
        expect(page).to have_link('Sign Up')
        #expect page not to have form to add a peep
    end
end

