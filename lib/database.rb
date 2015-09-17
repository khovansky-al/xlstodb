require 'active_record'
require 'yaml'

class Database

  def initialize
    dbconfig = YAML::load(File.open(File.join(File.dirname(__FILE__), 'config/database.yml')))
    ActiveRecord::Base.establish_connection(dbconfig)
  end


end

# Dirty migration for testing purposes
#
# class Create < ActiveRecord::Migration
#
#   def initialize
#     dbconfig = YAML::load(File.open(File.join(File.dirname(__FILE__), 'config/database.yml')))
#     ActiveRecord::Base.establish_connection(dbconfig)
#   end
#
#   def up
#
#     create_table "adverts" do |t|
#       t.string   "declarant"
#       t.string   "advtype"
#       t.string   "permission"
#       t.string   "road"
#       t.integer  "house"
#       t.string   "letter"
#       t.integer  "housing"
#       t.string   "clarification"
#       t.string   "crossroad"
#       t.string   "crossroadhouse"
#       t.string   "lettercrossroadhouse"
#       t.string   "housingcrossroadhouse"
#       t.string   "clarcrossroadhouse"
#       t.datetime "created_at",            null: false
#       t.datetime "updated_at",            null: false
#       t.string   "photo"
#     end
#
#   end
#
# end
