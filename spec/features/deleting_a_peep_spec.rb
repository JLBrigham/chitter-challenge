feature 'Deleting a bookmark' do
    scenario 'A user can delete a peep' do
        Peeps.create(name: 'Norman', username: 'Normsta', peep: 'I love tennis balls')
        visit('/')
        expect(page).to have_content('I love tennis balls')

        first('.peeps').click_button 'Delete'

        expect(current_path).to eq '/'
        expect(page).not_to have_content('I love tennis balls')
    end
end