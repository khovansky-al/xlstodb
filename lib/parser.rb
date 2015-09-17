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

    # sheet.each do |row|

    row = sheet[0]
    puts "Saving to DB"
    adv = Advert.new
    adv.declarant = row.cells[0].value
    adv.save
    puts "Saved"
    puts adv
    puts Advert.all
    # row.cells.each_with_index do |cell, i|
    #   puts "#{i} #{cell.value}"
    # end
  end
end
