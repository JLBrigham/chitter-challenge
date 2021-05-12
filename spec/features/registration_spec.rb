feature 'registration' do
    scenario 'a user can sign up' do
     sign_up
    expect(page).to have_content "Chitter"
    expect(page).not_to have_button 'Sign Out'
    end
end
