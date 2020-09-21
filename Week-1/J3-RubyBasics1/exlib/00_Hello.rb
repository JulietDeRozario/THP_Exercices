def say_hello(first_name)
    puts "Bonjour #{first_name}"
end

def ask_first_name
    puts"Quel est votre prénom ?"
    first_name=gets.chomp
end

def perform
    first_name=ask_first_name
    say_hello(first_name)
    return first_name
end

perform