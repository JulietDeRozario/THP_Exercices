#Calcule le nombre de travail en heures à THP en multipliants des variables correspondants au nombre d'heures par jour,
# au nombre de jours par semaines, et au nombre de semaines de la formation
number_of_hours_worked_per_day = 10
number_of_days_worked_per_week = 5
number_of_weeks_in_THP = 11

puts "Travail : #{number_of_hours_worked_per_day * number_of_days_worked_per_week * number_of_weeks_in_THP}"
#Essaie de convertir cette durée en minutes en multipliant par 60 (60min/h) mais la variable "number_of_minutes_in_an_hour" nest pas déclarée, ce qui entraine une erreur
puts "Et en minutes ça fait : #{number_of_minutes_in_an_hour * number_of_hours_worked_per_day * number_of_days_worked_per_week * number_of_weeks_in_THP}"

