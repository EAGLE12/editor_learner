require 'fileutils'

module RubyNovice
random = rand(1..4)
  s = %(#{random}.rb)

  FileUtils.cp("mon/#{s}", "que.rb")
p random

f = File.open("que.rb")
s = f.read
f.close

f1 = File.open("an.rb")
s1 = f1.read
f1.close

p s
p s1

start_time = Time.now
loop do
    sleep(1)
    if File.exist?("que.rb") && File.exist?("an.rb")
      if FileUtils.compare_file("que.rb", "an.rb") == true
        break
      end
      else
        diffs = Diff::LCS.diff(s,s1)
        diffs.each do |diff|
          p diff
      end
    end
end
end_time = Time.now
time = end_time - start_time - 1

  puts "#{time} sec"
end