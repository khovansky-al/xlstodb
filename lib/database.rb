require 'activerecord'
require 'yaml'

module XLSToDB

  class Database

    def initialize
      dbconfig = YAML::load(File.open('config/database.yml'))
      ActiveRecord::Base.establish_connection(dbconfig)
    end

  end

end
