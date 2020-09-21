def is_multiple_of_3_or_5?(current_number)
     (current_number%3==0 || current_number%5==0)? true : false
end

def sum_of_3_or_5_multiples(final_number)
    multiples=[] 

    if final_number==0 || final_number==3
        return 0
    elsif final_number.class!=Integer || final_number<0
        return "Yo ! Je ne prends que les entiers naturels. TG"
    else 
        for value in (1...final_number )
            if value%3==0 || value%5==0
                multiples<<value
            end
        end
    end
    return multiples.inject(0){|s,x| s + x }
end