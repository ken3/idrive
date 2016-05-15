#!/usr/bin/ruby

# Import music data from BMW idrive USB Backup
#     MP4 : *.BR3
#     MP3 : *.BR4
#     WMA : *.BR5
#     AAC : *.BR25
#
# usage: import_from_idrive.rb files...

ARGV.each do |f|
    begin
        music = File.binread(f).bytes.collect{|c| c^0xff}.pack("C*")
        puts "#{f} size=#{music.size}"
        File.binwrite("#{f}.music", music)
    rescue => e
        puts e.message
    end
end

