feature 'Updating a peep' do
  scenario 'A user can update a peep' do
    peep = Peeps.create(name: 'Norman', username: 'Normsta', peep: 'I love tennis balls')
    sign_up_and_sign_in
    expect(page).to have_content('I love tennis balls')

    first('.peep').click_button 'Edit'
    expect(current_path).to eq "/#{peep.id}/edit"

    fill_in('peep', with: 'I really really love sticks')
    click_button('Update')

    expect(current_path).to eq '/'
    expect(page).not_to have_content('I love tennis balls')
    expect(page).to have_content('I really really love sticks')

  end
end
