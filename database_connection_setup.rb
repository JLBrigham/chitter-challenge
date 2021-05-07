require './lib/database_connection'

if ENV['ENVIRONMENT'] = 'test'
    DatabaseConnection.setup('new_chitter_test')
else
    DatabaseConnection.setup('chitter')
end