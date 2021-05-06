require 'pg'

class Peeps
    attr_reader :id, :name, :username, :peep, :time

    def initialize(id:, name:, username:, peep:, time:)
        @id = id
        @name = name
        @username = username
        @peep = peep
        @time = time[0...16]
    end


    def self.all
        if ENV['Environment'] = 'test'
        connection = PG.connect(dbname: 'new_chitter_test')
        else
        connection = PG.connect(dbname: 'chitter')
        end
        result = connection.exec("SELECT * FROM peeps;")
        result.map do |peep| 
            Peeps.new(id: peep['id'], name: peep['name'], username: peep['username'], peep: peep['peep'], time: peep['time']) 
        end
    end

    def self.create(name:, username:, peep:)
        if ENV['Environment'] = 'test'
            connection = PG.connect(dbname: 'new_chitter_test')
            else
            connection = PG.connect(dbname: 'chitter')
            end
      
        result = connection.exec("INSERT INTO peeps (name, username, peep) VALUES('#{name}', '#{username}', '#{peep}') RETURNING id, name, username, peep, time")
        Peeps.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], peep: result[0]['peep'], time: result[0]['time'])
      end

end