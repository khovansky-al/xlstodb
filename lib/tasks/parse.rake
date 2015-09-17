namespace :parse do
  desc "Start parsing"
  task :start, :filename do |t, args|

    Parser.new do |p|
      p.filename = args[:filename]
    end.parse!

  end
end
