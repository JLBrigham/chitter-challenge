feature 'Deleting a peep' do
  scenario 'A user can delete their own peep' do
    Peeps.create(name: 'Norman', username: 'normsta', peep: 'I love tennis balls')
    sign_up_and_sign_in_as_norman
    expect(page).to have_content('I love tennis balls')

    first('.peep').click_button 'Delete'

    expect(current_path).to eq '/'
    expect(page).not_to have_content('I love tennis balls')
  end

  scenario 'a user cannot delete a peep by another user' do
    Peeps.create(name: 'Norman', username: 'normsta', peep: 'I love tennis balls')

    sign_up_and_sign_in

    expect(page).to have_content('I love tennis balls')
    expect(page).not_to have_button('Delete')
  end
end
