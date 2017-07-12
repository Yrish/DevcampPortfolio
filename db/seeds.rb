# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


3.times do |topic|
    Topic.create!(title: "An amazing topic ##{topic}")
end

puts "finished with topics"

10.times do |blog|
   Blog.create!(
    title: "My Blog Post #{blog}",   
    body: "This is Post #{blog}",
    topic_id: (blog % 3) + 1
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
       main_image: "https://placehold.it/500x300",
       thumb_image: "https://placehold.it/300x250"
       ) 
end


puts "finished with portfolios"

3.times do |technology|
    Portfolio.last.technologies.create!(name:"Technology #{technology}")
end

puts "finished with technologies"