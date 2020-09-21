number=0
name="jeandujardin"
mail="thp.com"
emails = ["#{name}.#{number}@#{mail}"]
newmail = ""

while number>-1 && number<50
    number+=1
    newmail="#{name}.#{number}@#{mail}"
    emails << newmail
    puts newmail
end

