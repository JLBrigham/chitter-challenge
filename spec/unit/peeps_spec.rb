require 'peeps'
require 'pg'
require 'database_helpers'

describe Peeps do
describe '.all' do
    it 'returns a list of peeps' do
    
      Peeps.create(name: 'Norman', username: 'Normsta', peep: 'I love tennis balls')
      Peeps.create(name: 'Ronnie', username: 'Ron John Silver', peep: 'Im teeny tiny')


      peeps = Peeps.all

      p peeps
  
      expect(peeps.length).to eq 2
      expect(peeps.first.name).to eq 'Norman'
      expect(peeps.first.username).to eq 'Normsta'
      expect(peeps.first.peep).to eq 'I love tennis balls'
      

    end
  end

  describe '.create' do
    it 'creates a new peep' do
        peep = Peeps.create(name: 'Norman', username: 'Normsta', peep: 'I love tennis balls')

        persisted_data = persisted_data(id: peep.id)

    expect(peep).to be_a Peeps
    expect(peep.id).to eq persisted_data['id']
    expect(peep.name).to eq 'Norman'
    expect(peep.username).to eq 'Normsta'
    expect(peep.peep).to eq 'I love tennis balls'
    end
end
end