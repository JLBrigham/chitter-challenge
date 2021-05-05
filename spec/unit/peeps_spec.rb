require 'peeps'


describe '.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (name, username, peep) VALUES ('Joanna', 'jojobrigs', 'This is my first peep');")


      peeps = Peeps.all
  
      expect(peeps).to include "This is my first peep"

    end
  end

  describe '.create' do
    it 'creates a new peep' do
        Peeps.create(name: 'Joanna', username: 'jojobrigs', peep: 'Peep, Peep, Peep')

    expect(Peeps.all).to include 'Peep, Peep, Peep'
    end
end