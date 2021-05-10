def sign_up
    visit '/'
    click_link('Sign Up')
    fill_in('name', with: 'Joanna')
    fill_in('username', with: 'jojobrigs')
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'password123')
    click_button('Submit')
end
