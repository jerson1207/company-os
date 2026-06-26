puts "Seeding companies..."

@company = Company.find_or_create_by!(name: "Acme Corporation") do |c|
  c.owner = @admin
end

puts "Companies seeded"
