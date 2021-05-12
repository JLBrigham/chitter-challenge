feature 'Deleting a peep' do
  scenario 'A user can delete a peep' do
    Peeps.create(name: 'Norman', username: 'Normsta', peep: 'I love tennis balls')
    sign_up_and_sign_in
    expect(page).to have_content('I love tennis balls')

    first('.peep').click_button 'Delete'

    expect(current_path).to eq '/'
    expect(page).not_to have_content('I love tennis balls')
  end
end
