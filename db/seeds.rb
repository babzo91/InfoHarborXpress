# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Suppression des données"
Result.destroy_all
puts "Resultats supprimés"
Search.destroy_all
puts "Recherche supprimées"
puts "Voulez-vous supprimer les utilisateurs ? (y/n)"
answer = gets.chomp
if answer == "y" || answer == "Y"
  User.destroy_all
  puts "Utilisateurs supprimés"
else
  puts "Utilisateurs conservés"
end

User.create!(first_name: "Iqbal", last_name: "Bashir", email: "iqbal@bashir.com", password: "123456")
User.create!(first_name: "Thierry", last_name: "Edmon", email: "thierry@edmon.com", password: "123456")
User.create!(first_name: "Tai", last_name: "Tran", email: "tai@tran.com", password: "123456")
User.create!(first_name: "Harris", last_name: "Shahbaz", email: "harris@shahbaz.com", password: "123456")

puts "********************************************************************************************************"
puts "********************************************************************************************************"
puts "********************************************************************************************************"

puts "> Users Created !"

puts "********************************************************************************************************"
puts "********************************************************************************************************"
puts "********************************************************************************************************"
