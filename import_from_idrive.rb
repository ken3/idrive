#!/usr/bin/ruby

# 機能: BMW idriveのUSB Backupで採取したファイルを音楽データに復元する
# 作成: 2016-05-15 ken3@nurs.or.jp
# 更新: 2016-05-15 ken3@nurs.or.jp
#
# データ形式とファイル名の対応
#     MP4 : *.BR3
#     MP3 : *.BR4
#     WMA : *.BR5
#     AAC : *.BR25
#
# 起動方法
#     $ import_from_idrive.rb files...

ARGV.each do |f|
    begin
        music = File.binread(f).bytes.collect{|c| c^0xff}.pack("C*")
        puts "#{f} size=#{music.size}"
        File.binwrite("#{f}.music", music)
    rescue => e
        puts e.message
    end
end

