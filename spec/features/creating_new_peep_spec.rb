feature 'Adding a new peep' do
  scenario 'A user can add a peep to chitter' do
    sign_up_and_sign_in

    fill_in('peep', with: 'Peep, Peep, Peep')
    click_button('Add Peep')

    expect(page).to have_content 'Peep, Peep, Peep'
  end
end
