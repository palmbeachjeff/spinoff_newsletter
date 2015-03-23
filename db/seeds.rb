# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'
Spinoff.delete_all
csv_path = "#{Rails.root}/db/Spinoffdata.csv"

CSV.foreach("#{csv_path}") do |row|
 next if row[1].blank? || row[1] == "parent_name"
 puts Spinoff.create(parent_name: row[1], 
                    parent_ticker: row[2], 
                    spinoff_name: row[3],
                    spinoff_ticker: row[4],
                    spinoff_date: row[5])
end

data = YahooFinance.quotes(tickers, [:change, :change_and_percent_change, :change_in_percent, :close, :last_trade_price, :last_trade_time, :name, :symbol, :trade_date, :ask, :bid, :last_trade_date], { raw: false } )