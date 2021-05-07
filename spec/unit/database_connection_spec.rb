require 'database_connection'

describe DatabaseConnection do
    describe '.setup' do
        it 'sets up a connection to a database through PG' do
            expect(PG).to receive(:connect).with(dbname: 'new_chitter_test')

            DatabaseConnection.setup('new_chitter_test')
        end
    end
end
