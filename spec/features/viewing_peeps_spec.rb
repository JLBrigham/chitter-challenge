feature 'Viewing Peeps' do
  scenario 'peeps should only be visible if user is signed in' do
    Peeps.create(name: 'Norman', username: 'Normsta', peep: 'I love tennis balls')
    visit('/')
    expect(page).not_to have_content "I love tennis balls"
  end
end
