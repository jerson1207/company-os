puts "Seeding users..."

@admin = User.find_or_create_by!(email: "admin@test.com") do |u|
  u.password = "password123"
end

@member = User.find_or_create_by!(email: "member@test.com") do |u|
  u.password = "password123"
end

puts "Users seeded"
