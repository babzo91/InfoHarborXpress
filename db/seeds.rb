include ScrapHelper
include AuchanHelper
include GrosbillHelper

puts "Suppression des données"
Result.destroy_all
puts ""
puts "Resultats supprimés"
Search.destroy_all
puts ""
puts "Recherche supprimées"
User.destroy_all
puts ""
puts "Utilisateurs supprimés"
puts ""
User.create!(first_name: "Iqbal", last_name: "Bashir", email: "iqbal@bashir.com", password: "123456")
User.create!(first_name: "Thierry", last_name: "Edmon", email: "thierry@edmon.com", password: "123456")
User.create!(first_name: "Tai", last_name: "Tran", email: "tai@tran.com", password: "123456")
harris = User.create!(first_name: "Harris", last_name: "Shahbaz", email: "harris@shahbaz.com", password: "123456")
puts ""
puts "> Utilisateurs créés"
puts ""
puts "Création des recherches"
puts ""

brico = Search.create!(url: "https://www.auchan.fr/jardin-auto-brico/bricolage/ca-7135356", name: "Auchan Bricolage", user_id: harris.id)
csv_file = AuchanHelper.auchan(brico.url)
Result.create!(search_id: brico.id, csv_file: csv_file)
puts "Auchan Brico OK"

audio = Search.create(url: "https://www.auchan.fr/high-tech-audio-tv-telephonie/audio-hifi-home-cinema/ca-8262", name: "Auchan Audio", user_id: harris.id)
csv_file = AuchanHelper.auchan(audio.url)
Result.create!(search_id: audio.id, csv_file: csv_file)
puts "Auchan Audio OK"

ordinateur_portable = Search.create(url: "https://www.grosbill.com/2-ordinateur_portable-cat-ordinateurs", name: "Grosbill Ordinateur Portable", user_id: harris.id)
csv_file = GrosbillHelper.grosbill(ordinateur_portable.url)
Result.create!(search_id: ordinateur_portable.id, csv_file: csv_file)
puts "Grosbill Ordinateur Portable OK"

playmobil = Search.create(url:"https://www.auchan.fr/jouets-jeux-video-loisirs/jeux-jouets/lego-playmobil-construction/playmobil/ca-6856166", name: "Auchan Playmobil", user_id: harris.id)
csv_file = AuchanHelper.auchan(playmobil.url)
Result.create!(search_id: playmobil.id, csv_file: csv_file)
puts "Auchan Playmobil OK"

tefal = Search.create(url: "https://www.auchan.fr/marques/marque-tefal/ca-7476073", name: "Auchan Tefal", user_id: harris.id)
csv_file = AuchanHelper.auchan(tefal.url)
Result.create!(search_id: tefal.id, csv_file: csv_file)
puts "Auchan Tefal OK"

moto = Search.create(url: "https://www.auchan.fr/jardin-auto-brico/auto-moto/ca-7290055", name: "Auchan Auto", user_id: harris.id)
csv_file = AuchanHelper.auchan(moto.url)
Result.create!(search_id: moto.id, csv_file: csv_file)
puts "Auchan Moto OK"

multicuiseur = Search.create(url: "https://www.auchan.fr/electromenager-cuisine/petits-appareils-de-cuisine/robot-de-cuisine/multicuiseur/ca-201609161742", name: "Auchan Multicuiseur", user_id: harris.id)
csv_file = AuchanHelper.auchan(multicuiseur.url)
Result.create!(search_id: multicuiseur.id, csv_file: csv_file)
puts "Auchan Multicuiseur OK"


tv = Search.create(url: "https://www.grosbill.com/1-tv-video", name: "Grosbill TV", user_id: harris.id)
csv_file = GrosbillHelper.grosbill(tv.url)
Result.create!(search_id: tv.id, csv_file: csv_file)
puts "Grosbill TV OK"

velo = Search.create(url: "https://www.auchan.fr/jouets-jeux-video-loisirs/sport-plein-air/velo-cyclisme/velo-enfant/velo-de-6-a-12-ans/ca-201901241520", name: "Auchan Velo", user_id: harris.id)
csv_file = AuchanHelper.auchan(velo.url)
Result.create!(search_id: velo.id, csv_file: csv_file)
puts "Auchan Velo OK"
