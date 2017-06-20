# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do |blog|
   Blog.create!(
    title: "My Blog Post #{blog}",   
    body: "This is Post #{blog}"
    ) 
end

puts "finished with blogs"

5.times do |skill|
   Skill.create!(
    title: "skill #{skill}",   
    percent_utilized: skill
    ) 
end

puts "finished with skills"

9.times do |portfolio_item|
   Portfolio.create!(
       title: "Portfolio title #{portfolio_item}",
       subtitle: "Something awesome",
       body: "I don't have any latin",
       main_image: "http://placehold.it/#{portfolio_item * 10 + 20}x200",
       thumb_image: "http://placehold.it/#{portfolio_item * 2 + 10}x#{portfolio_item * 2 + 10}"
       ) 
end

puts "finished with portfolios"