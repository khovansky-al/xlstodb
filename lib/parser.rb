require 'rubyXL'

Dir[File.dirname(__FILE__) + '/*.rb'].each {|file| require file }

class Parser

  attr_accessor :filename

  def initialize &block
    instance_eval &block
  end


  def parse!
    puts "Nine' One xls -> DB reader"
    puts "Initializing database connection"

    db = Database.new

    puts "Parsing " + filename

    workbook = RubyXL::Parser.parse(filename)

    puts "Done parsing. Cleaning up id column and title row"

    sheet = workbook[0]
    sheet.delete_row(0)
    sheet.delete_column(0)

    puts "Saving records"

    i = 0

    sheet.each do |row|

      adv = Advert.new
      row.cells.each_with_index do |cell, i|
        adv.__send__(Advert.fields.key(i) + '=', cell.value)
      end
      adv.save
      print '.'
      i+=1
    end
    puts
    puts "Done! #{i} records processed"
  end
end
