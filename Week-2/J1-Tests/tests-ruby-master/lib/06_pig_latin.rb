def translate(str)
    consonants=[]
    many_words=[]
    str.split.map {|word|
    if word[0].match(/[aeoui]/)
        return word+"ay"
    elsif word[0].match(/[ b c d f g h j k l m n p q r s t v w x y z]/)
        if word[1].match(/[aeoui]/)
            if word[1]!="u"
                consonants<<word[1..word.size]
                consonants<<word[0]+"ay"

            elsif word[1]=="u"
                consonants<<word[2..word.size] 
                consonants<<word[0..1]+"ay"
            end
            many_words<<consonants
            return consonants.join("") if str.split.size==1

        elsif word[1].match(/[ b c d f g h j k l m n p q r s t v w x y z ]/)

            if word[2]!="u"
                consonants<<word[2..word.size]
                consonants<<word[1]+"ay"
            
            elsif word[2]=="u"
                consonants<<word[3..word.size]
                consonants<<word[1..2]+"ay" 
            end
            many_words<<consonants
            return consonants.join("") if str.split.size==1
        elsif word[2].match(/[ b c d f g h j k l m n p q r s t v w x y z ]/)
            consonants<<word[3..word.size]
            consonants<<word[2]+"ay" if word[3]!="u"
            consonants<<word[2..3]+"ay" if word[3]=="u"
            many_words<<consonants
            return consonants.join("") if str.split.size==1
        end
    end }
    return many_words.join("") if str.size >1

end    

#====================> Là, c'est le moment où je cède à Morphée : je laisse tomber cet exercice de satan.