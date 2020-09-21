puts "Choisissez un nombre :"
number=gets.chomp.to_i
i=1
y=number
while i>0 && (i<number || i==number)
        y.times do
        print " "
        end
        i.times do
            print "#"
        end
    puts ""
    y-=1
    i+=1
end