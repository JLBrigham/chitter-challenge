require 'pg'

class Peeps

    def self.all
        if ENV['Environment'] == 'test'
        connection = PG.connect(dbname: 'chitter_test')
        else
        connection = PG.connect(dbname: 'chitter')
        end
        result = connection.exec("SELECT * FROM peeps;")
        result.map {|peep| peep['peep']}
    end

    def self.create(name:, username:, peep:)
        if ENV['Environment'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
            else
            connection = PG.connect(dbname: 'chitter')
            end
      
        connection.exec("INSERT INTO peeps (name, username, peep) VALUES('#{name}', '#{username}', '#{peep}')")
      end

end