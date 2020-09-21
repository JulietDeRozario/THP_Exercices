#===> Convertit les secondes en minutes et en heures
def time_string(sec)
    #===> Ici, j'ai utilisé la classe "Time" qui permet d'afficher des horaires et/ou des dates.
    Time.at(sec).utc.strftime("%H:%M:%S")
    #===> Je lui incrémente ma variable "sec" (temps en secondes à convertir), UTC (ou Coordinated Universal Time) est la principale norme de temps avec laquelle le monde régule ses horloges. strftime défini les ordres de grandeurs Heures/Minutes/Secondes.
end