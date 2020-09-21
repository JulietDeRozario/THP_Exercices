def caesar_cipher(message, key)
    letters = ('a'..'z').to_a + ('A'..'Z').to_a
    ciphered_message = []

    if message.class!=String || key.class!=Integer
        return "T'as pas compris le principe ou t'es juste relou ?"
    else 
        message.split('').each {|carac|
            if letters.include? carac
                new_letter_ord = (carac.ord + key)
                if new_letter_ord > 96 && new_letter_ord < 123 || new_letter_ord > 64 && new_letter_ord < 91
                    ciphered_message << new_letter_ord.chr 
                else  
                    ciphered_message << (new_letter_ord - 26).chr 
                end
            else
                ciphered_message << carac
            end
        }
    end
        return ciphered_message.join
end