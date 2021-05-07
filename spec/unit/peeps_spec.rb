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

      persisted_data = persisted_data(id: peep.id, table: :peeps)

      expect(peep).to be_a Peeps
      expect(peep.id).to eq persisted_data['id']
      expect(peep.name).to eq 'Norman'
      expect(peep.username).to eq 'Normsta'
      expect(peep.peep).to eq 'I love tennis balls'
    end
  end

  describe '.delete' do
    it 'deletes a peep' do
      peep = Peeps.create(name: 'Norman', username: 'Normsta', peep: 'I love tennis balls')

      Peeps.delete(id: peep.id)
    
      expect(Peeps.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'updates a peep' do
      peep = Peeps.create(name: 'Norman', username: 'Normsta', peep: 'I love tennis balls')
      updated_peep = Peeps.update(id: peep.id, name: peep.name, username: peep.username, peep: 'I really really love sticks')
      
      p updated_peep

      expect(updated_peep).to be_a Peeps
      expect(updated_peep.id).to eq peep.id
      expect(updated_peep.name).to eq 'Norman'
      expect(updated_peep.peep).to eq 'I really really love sticks'
    end
  end

end
