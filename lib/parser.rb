require 'rubyXL'

class Parser

  attr_accessor :filename

  def initialize &block
    instance_eval &block

    puts "Nine' One xls -> DB reader"
    puts "Initializing database connection"

    db = Database.new
    
    puts "Parsing " + filename

    workbook = RubyXL::Parser.parse(filename)

    puts "Done parsing. Cleaning up id column and title row"

    # sheet = workbook[0]
    # sheet.delete_row(0)
    # sheet.delete_column(0)
    #
    # row = sheet[0]
    # row.cells.each_with_index do |cell, i|
    #   puts "#{i} #{cell.value}"
    # end

  end


  def parse!
    puts "Test"
  end
end
