puts "Choisissez un nombre :"
number=gets.chomp.to_i
i=1
while i>0 && (i<number || i==number)
        i.times do
            print "#"
        end
    puts ""
    i+=1
end