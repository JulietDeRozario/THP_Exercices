require 'nokogiri'
require 'open-uri'
require 'rubygems'

class Program  

  #===> On va récupérer les liens de chaque mairie de chaque commune
  def get_townhall_links(doc)
    townhall_links = [] #==> Tableau dans lequel je vais stoquer mes liens
    doc.css("p > a").each do |link| #==> Je parcours tous les liens vers le site de chaque commune
        townhall_link = link["href"][1..-1] #=> Je supprime le "." au début de l'url
        townhall_links << "https://annuaire-des-mairies.com" + townhall_link #==> Je complète le chemin de chaque lien pour qu'il soit utilisable et je le stoque dans mon tableau 
    end

    return townhall_links
  end

  #==> On va récupérer les noms des différentes communes
  def get_townhall_names(doc)
    townhall_names = [] #==> Tableau pour stoquer les noms

    doc.css("p > a").each do |link| #==> Je parcours mes liens
        townhall_names << link.content #==> Je range chaque nom dans mon tableau
    end

  return townhall_names
  end


  #===> On va récupérer les emails sur le site des mairies de chaque commune
  def get_townhall_emails(townhall_links)
    townhall_emails = [] #==> Tableau qui va stoquer ces emails

    townhall_links.each do |link| #==> Je parcours le tableau qui contient les liens vers les sites de chaque mairie
      new_doc = Nokogiri::HTML(URI.open(link)) #==> Je scrappe vers chaque lien
      email = new_doc.css("table.table:nth-child(1) > tbody:nth-child(3) > tr:nth-child(4) > td:nth-child(2)")
      townhall_emails << email.text #==> J'y récupère l'email que je stoque dans mon tableau
    end
    return townhall_emails
  end


  #===> On va réunir ces valeurs dans un hash
  def get_the_emails_hash(townhall_names, townhall_emails)
    townhall_emails_hash = Hash.new
    townhall_infos_arr = []
    counter = 0 #==> Counter pour faire tourner ma boucle


    while counter < townhall_names.length #==> J'associe dans un hash le nom de chaque commune avec son adresse mail en utilisant mes deux tableaux précédents
      townhall_emails_hash.merge!(Hash[townhall_names[counter] => townhall_emails[counter]])
      counter +=1 
    end
    return townhall_emails_hash
  end


  #===> Méthode perform pour lancer mon programme
  def perform(doc)
    townhall_links = get_townhall_links(doc)
    townhall_names = get_townhall_names(doc)
    townhall_emails = get_townhall_emails(townhall_links)
    get_the_emails_hash(townhall_names, townhall_emails)
  end

end