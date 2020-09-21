def word_counter(verse, dictionnary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"])
other_word_index = 1
letters = ('a'..'z').to_a + ('A'..'Z').to_a
same_words = []
result= Hash.new
verse.split(" ").map{ |word|
    while other_word_index <= verse.size
        word.split('').map{ |carac|
            if letters.include?(carac)
                carac.downcase! 
            else 
                word.delete! carac
            end
        }
        if word == dictionnary[other_word_index] || word.include?(dictionnary[other_word_index]).to_s
            same_words << word + dictionnary[other_word_index]
        end 
        result.merge!({word => same_words.size })
        same_words=[]
        other_word_index +=1
    end
    same_words = []
    other_word_index = 1
}

result= result.map{|key, val| [key.to_s, val] }.sort
return result.to_h
end


