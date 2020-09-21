require 'bundler'
Bundler.require

class Gossip
    attr_reader :author, :content
    
    def initialize(author, content)
      @author = author
      @content = content
    end
  
    def save
      CSV.open("db/gossip.csv", "ab") do |csv|
        csv << [@author, @content]
      end 
    end
  
    def self.all
      all_gossips = []
      CSV.foreach("db/gossip.csv") do |col|
        gossip_temp = Gossip.new(col[0], col[1])
        all_gossips << gossip_temp
      end
      all_gossips
    end

    def self.delete_gossip(index)
      all_gossips = []
      counter = 1
      CSV.foreach("db/gossip.csv") do |col|
        if counter != index
        gossip_temp = Gossip.new(col[0], col[1])
        all_gossips << gossip_temp
        end
        counter += 1
      end

      File.open("db/gossip.csv", "w+") do |line|
        all_gossips.each do |gossip|
          line.puts("#{gossip.author}, #{gossip.content}")
        end
      end

    end
end