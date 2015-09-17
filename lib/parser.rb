module XLSToDB

  class Parser < ActiveRecord::Base

    def initialize
      puts "Nine' One xls -> DB reader"
      puts 'Parsing ' + filename

      workbook = RubyXL::Parser.parse(filename)
      sheet = workbook[0]

      sheet.delete_row(0)
      sheet.delete_column(0)

      row = sheet[0]
      row.cells.each_with_index do |cell, i|
        puts "#{i} #{cell.value}"
      end

    end


  end

end
