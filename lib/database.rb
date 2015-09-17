require 'active_record'
require 'yaml'

class Database

  def initialize
    dbconfig = YAML::load(File.open(File.join(File.dirname(__FILE__), 'config/database.yml')))
    ActiveRecord::Base.establish_connection(dbconfig)
  end


end
