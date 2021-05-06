feature 'displaying peeps in reverse order' do
  scenario 'peeps are displayed newest first' do
    Peeps.create(name: 'Norman', username: 'Normsta', peep: 'I love tennis balls')
    Peeps.create(name: 'Ronnie', username: 'Ron John Silver', peep: 'Im teeny tiny')
    visit '/'
    expect(first('.peep')).to have_content 'Im teeny tiny'
  end
end
