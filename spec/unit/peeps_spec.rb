require 'peeps'


describe '.all' do
    it 'returns a list of peeps' do
      peeps = Peeps.all
  
      expect(peeps).to include "This is my first peep"

    end
  end