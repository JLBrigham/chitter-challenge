require 'peeps'
require 'pg'

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
        peeps = Peeps.create(name: 'Norman', username: 'Normsta', peep: 'I love tennis balls')
        print peeps
        #persisted_data = PG.connect(dbname: 'new_chitter_test').query("SELECT * FROM peeps WHERE id = #{peep.id};")
        #print persisted_data

    #expect(peep).to be_a Peeps
    #expect(peep.id).to eq persisted_data.first['id']
    expect(peeps.name).to eq 'Norman'
    expect(peeps.username).to eq 'Normsta'
    expect(peeps.peep).to eq 'I love tennis balls'
    end
end
end