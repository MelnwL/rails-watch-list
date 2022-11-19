# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# si besoin
# quand j'exécute le fichier seed (rails db:seed),  ça commence par nettoyer la DB des précédents peuplements :
puts 'clearing Movies'
Movie.destroy_all

puts 'Creating 6 movies'
6.times do
  movie = Movie.new(
    title: Faker::Movie.title,
    overview: Faker::Lorem.paragraphs,
    poster_url: Faker::Internet.url,
    rating: rand(0..5)
  )
  movie.save!
end
puts 'Finished!'

puts 'clearing Lists'
List.destroy_all

puts 'Creating 5 lists'
5.times do
  list = List.new(
    name: Faker::Name.name
  )
  list.save!
end
puts 'Finished!'

puts 'clearing bookmarks'
Bookmark.destroy_all

puts 'Creating bookmarks'
bookmark1 = { content: 'blablabla', list_id: 1, movie_id: 1 }
bookmark2 = { content: 'ffffffff', list_id: 2, movie_id: 3 }
[bookmark1, bookmark2].each do |attributes|
  bookmark = Bookmark.create!(attributes)
  puts "Created #{bookmark.name}"
end
puts 'Finished!'
