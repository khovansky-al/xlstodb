#!/usr/bin/env ruby

Dir.glob('./lib/*.rb').each(&:require)

include XLSToDB

if ARGV.length < 1
  puts "No file provided"
  puts "Usage: #{__FILE__} [file]"
  Process.exit
end

filename = ARGV[0]

parser = Parser.new filename
