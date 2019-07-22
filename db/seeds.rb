puts "Cleaning up database"
User.destroy_all

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
  }]

  users.each do |user|
    user = User.create!(email: user[:email], password: user[:password])
  end

  puts "Created #{User.count} users."
