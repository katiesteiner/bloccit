require 'faker'

post_attributes = [
    { title: "This is a unique post in seeds.rb", body: "This is the body of my unique post in seeds.rb" },
    { title: "This is a another unique post in seeds.rb", body: "This is the other body of my unique post in seeds.rb" },
  ]
post_attributes.each do |attributes|
  Post.where(attributes).first_or_create
end

#Create Posts
50.times do
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
    )
end
posts = Post.all

#Create comments
100.times do
  Comment.create!(
      post: posts.sample,
      body: Faker::Lorem.paragraph
    )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
