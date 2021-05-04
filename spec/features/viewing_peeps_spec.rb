feature 'Viewing Peeps' do
    scenario 'visiting the index page' do
      visit('/peeps')
      expect(page).to have_content "This is my first peep"
    end
  end