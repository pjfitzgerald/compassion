# require 'open-uri'
# require 'nokogiri' ingredient = 'chocolate'
# url = "http://www.letscookfrench.com/recipes/find-recipe.aspx"
# html_file = open(url).read
# html_doc = Nokogiri::HTML(html_file)
# html_doc.search('.m_titre_resultat a').each do |element| puts element.text.strip
# puts element.attribute('href').value
# end


puts "Cleaning up database"
User.destroy_all
Match.destroy_all
Chatroom.destroy_all
Message.destroy_all
Profile.destroy_all
puts "Creating new database"

users = [
  {
    email: "batman@batman.com",
    password: "batman"
  },
  {
    email: "superman@superman.com",
    password: "superman"
  },
  {
    email: "spiderman@spiderman.com",
    password: "spiderman"
  },
  {
    email: "ironman@ironman.com",
    password: "ironman"
  },
  {
    email: "Wonderwoman@wonderwoman.com",
    password: "wonderwoman"
  }]

batman_messages = ["hey", "nice to meet you", "what was the best thing that happened today for you?" "hello", "how are you feeling?", "thanks for your help"]
other_messages = ["hi batman", "nice to meet you too", "what was the best thing that happened today for you?" "hello", "how are you feeling?", "thanks for your help"]



users.each do |user|
  user = User.create!(email: user[:email], password: user[:password], username: user[:username])
end

profile1 = Profile.create(animal: "Panda", adjective: "Considerate", user_id: 1)
profile2 = Profile.create(animal: "Bear", adjective: "Exuberant", user_id: 2)
profile3 = Profile.create(animal: "Koala", adjective: "Rational", user_id: 3)
profile4 = Profile.create(animal: "Camel", adjective: "Practical", user_id: 4)
profile5 = Profile.create(animal: "Fox", adjective: "Unassuming", user_id: 5)

# batman matches
Match.create!(user: User.find(1) , partner: User.find(2))
Match.create!(user: User.find(1) , partner: User.find(3))
Match.create!(user: User.find(1) , partner: User.find(4))
Match.create!(user: User.find(1) , partner: User.find(5))
Chatroom.create!(match: Match.find(1))
Chatroom.create!(match: Match.find(2))
Chatroom.create!(match: Match.find(3))
Chatroom.create!(match: Match.find(4))


puts "Created #{Profile.count} profiles."
puts "Created #{User.count} users."
puts "Created #{Match.count} matches."
puts "Created #{Chatroom.count} chatrooms."
puts "Created #{Message.count} messages."
