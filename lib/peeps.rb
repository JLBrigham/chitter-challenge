require 'pg'
require_relative 'database_connection'


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
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |peep| 
      Peeps.new(id: peep['id'], name: peep['name'], username: peep['username'], peep: peep['peep'], time: peep['time']) 
    end
  end

  def self.create(name:, username:, peep:)
    result = DatabaseConnection.query("INSERT INTO peeps (name, username, peep) VALUES('#{name}', '#{username}', '#{peep}') RETURNING id, name, username, peep, time")
    Peeps.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], peep: result[0]['peep'], time: result[0]['time'])
    end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM peeps WHERE id = #{id}")
    end

  def self.update(id:, name:, username:, peep:)
    result = DatabaseConnection.query("UPDATE peeps SET peep = '#{peep}' WHERE id = #{id} RETURNING id, name, username, peep, time;")
    Peeps.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], peep: result[0]['peep'], time: result[0]['time'])
  end

end
