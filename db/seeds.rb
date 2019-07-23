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
  }]

test_messages = ["testing 1234", "nice to meet you", "what was the best thing that happened today for you?" "hello", "how are you feeling?", "thanks for your help"]

users.each do |user|
  user = User.create!(email: user[:email], password: user[:password])
end

matched_users = User.limit(2)
Match.create!(user: matched_users[0], partner: matched_users[1])
Chatroom.create!(match: Match.first)

matches = Match.all
matches.each do |match|
  test_messages.each do |message|
    Message.create!(user: match.user, chatroom: match.chatroom, content: message)
  end
end



puts "Created #{User.count} users."
puts "Created #{Match.count} matches."
puts "Created #{Chatroom.count} chatrooms."
puts "Created #{Message.count} messages."
