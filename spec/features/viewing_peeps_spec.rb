feature 'Viewing Peeps' do
    scenario 'visiting the peeps page' do
      Peeps.create(name: 'Norman', username: 'Normsta', peep: 'I love tennis balls')
      visit('/')
      expect(page).to have_content "I love tennis balls"
    end
  end

 