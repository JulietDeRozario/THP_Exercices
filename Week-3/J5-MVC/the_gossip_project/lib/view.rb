class View

    def create_gossip
      puts "Raconte-nous tes ragots :"
      print "> "
      content = gets.chomp.to_s
      puts "\nBalance ton nom :"
      print "> "
      author = gets.chomp.to_s
      return params = {content: content,author: author}
    end
  
    def index_gossips(all)
      index = 1
      all.each do |gossip|
        puts "#{index}- #{gossip.author} : #{gossip.content}"
        index +=1
      end    
    end
    
    def delete_gossip
      puts "Quel gossip veux tu supprimer ? (1/2/3...)"
      print "> "
      index = gets.chomp.to_i
      puts "potin supprimé avec succès !"
      return index
    end
end