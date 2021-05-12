feature 'Adding a new peep' do
  scenario 'A user can add a peep to chitter' do
    #sign_up_and_sign_in
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

    fill_in('peep', with: 'Peep, Peep, Peep')
    click_button('Add Peep')

    expect(page).to have_content 'Peep, Peep, Peep'
  end
end
