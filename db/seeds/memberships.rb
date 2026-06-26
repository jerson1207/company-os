puts "Seeding memberships..."

Membership.find_or_create_by!(user: @admin, company: @company) do |m|
  m.role = :admin
end

Membership.find_or_create_by!(user: @member, company: @company) do |m|
  m.role = :member
end

puts "Memberships seeded"
