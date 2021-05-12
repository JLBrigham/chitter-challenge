def sign_up
    visit '/'
    click_link('Sign Up')
    fill_in('name', with: 'Joanna')
    fill_in('username', with: 'jojobrigs')
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'password123')
    click_button('Submit')
end

def sign_up_and_sign_in
    visit '/'
    click_link('Sign Up')
    fill_in('name', with: 'Joanna')
    fill_in('username', with: 'jojobrigs')
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'password123')
    click_button('Submit')
    click_link('Sign In')
    fill_in('username', with: 'jojobrigs')
    fill_in('password', with: 'password123')
    click_button('Get Peeping')
end

def sign_up_and_sign_in_as_norman
    visit '/'
    click_link('Sign Up')
    fill_in('name', with: 'Norman')
    fill_in('username', with: 'normsta')
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'password123')
    click_button('Submit')
    click_link('Sign In')
    fill_in('username', with: 'normsta')
    fill_in('password', with: 'password123')
    click_button('Get Peeping') 
end
