require 'bundler'
Bundler.require

require_relative './lib/mairie_chistmas'


doc = Nokogiri::HTML(URI.open('https://annuaire-des-mairies.com/val-d-oise.html'))

my_program = Program.new

=begin
File.open("db/emsession = GoogleDrive::Session.from_config("config.json")ail2shash.json","w") do |f|
    f.write(my_program.perform(doc).to_json)
end
=end

json = File.read("db/emailshash.json")
obj = JSON.parse(json)
puts "JSON file created :"
pp obj

=begin
session = GoogleDrive::Session.from_config("config.json")

ws = session.spreadsheet_by_key("1ZqEqQzagspZhWPpVzSJLNhC0vefxRovbbkaEUYUGhjY").worksheets[0]
ws[1, 1] = "Towhall"
ws[1, 2] = "Townhall email"

i = 2
obj.each do |key, value|
    ws[i, 1] = key
    ws[i, 2] = value
    i+=1
    ws.save
end
=end
csv = File.write("db/emailshash.csv", obj)

