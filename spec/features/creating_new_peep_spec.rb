feature 'Adding a new peep' do
  scenario 'A user can add a peep to chitter' do
    visit('/')
    fill_in('name', with: 'Joanna')
    fill_in('username', with: 'jojobrigs')
    fill_in('peep', with: 'Peep, Peep, Peep')
    click_button('Add Peep')

    expect(page).to have_content 'Peep, Peep, Peep'
  end
end
