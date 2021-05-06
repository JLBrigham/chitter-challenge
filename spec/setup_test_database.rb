require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'new_chitter_test')
# Clear the peeps table
  connection.exec("TRUNCATE peeps;")
  p "Table Cleared"
end
