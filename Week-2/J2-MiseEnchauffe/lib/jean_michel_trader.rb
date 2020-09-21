def day_trader(prices)
    benefits = Hash.new
    prices_index = []

    prices.each{|price|
        counter = 0
        while counter < prices.length 
            # prix de revente - prix d'achat
                result = prices[counter] - price
                if result >= 0 && prices.index(price) < counter
                # on incrémente le jour d'achat
                    prices_index << prices.index(price) 
                # on incrémente le jour de revente
                    prices_index << counter 
                # on incrémente jour de revente - jour d'achat => bénéfice de la vente 
                    benefits.merge!({prices_index => result }) 
                end  
                counter += 1
                prices_index=[] 
        end
    }   
    return benefits.key(benefits.values.max)
end