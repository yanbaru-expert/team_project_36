require 'csv'

namespace :import_csv do
  # rake import_csv:texts
  desc "textに関するCSVデータをインポートするタスク"
  task texts: :environment do
    # インポートするファイルのパスを取得
    path = "db/csv_data/text_data.csv"
    # インポートするデータを格納するための配列
    list = []
    # CSVファイルからインポートするデータを取得し配列に格納
    CSV.foreach(path, headers: true) do |row|
      list << row.to_h
    end
    puts "インポート処理を開始"
    # インポートに成功した場合の処理
    begin
      Text.transaction do
        # 例外が発生する可能性のある処理
        Text.create!(list)
      end
        puts "インポート完了!!"
    rescue => e
      # 例外が発生した場合の処理
      # インポートができなかった場合の例外処理
      puts "#{e.class}: #{e.message}"
      puts "-------------------------"
      puts e.backtrace # 例外が発生した位置情報
      puts "-------------------------"
      puts "インポートに失敗"
    end
  end

  desc "movieに関するCSVデータをインポートするタスク"
  task movies: :environment do
    # インポートするファイルのパスを取得
    path = "db/csv_data/movie_data.csv"
    # インポートするデータを格納するための配列
    list = []
    # CSVファイルからインポートするデータを取得し配列に格納
    CSV.foreach(path, headers: true) do |row|
      list << row.to_h
    end
    puts "インポート処理を開始"
    # インポートに成功した場合の処理
    begin
      Movie.transaction do
        # 例外が発生する可能性のある処理
        Movie.create!(list)
      end
        puts "インポート完了!!"
    rescue => e
      # 例外が発生した場合の処理
      # インポートができなかった場合の例外処理
      puts "#{e.class}: #{e.message}"
      puts "-------------------------"
      puts e.backtrace # 例外が発生した位置情報
      puts "-------------------------"
      puts "インポートに失敗"
    end
  end
end