#!/usr/bin/env ruby

require '/media/win/Users/Oscar/workspace/RoR/korrigan/onopia/config/environment'
require 'csv'    

csv_text = File.read('/home/dougui/Bureau/records.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  row[11] = nil
  row[5] = 7
  row[8] = [6,7].shuffle[0]
  row = row.to_hash.with_indifferent_access
  Record.create!(row.to_hash.symbolize_keys)
end


