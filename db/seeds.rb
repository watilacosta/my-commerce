# Generate product categories

if Rails.env.development?
  categories = [
    "Grocery",
    "Shoes",
    "Home",
    "Music",
    "Health",
    " Kids",
    " Movies & Sports"
  ].each do |description|

    Category.create!(
      description:
    )
  end

  admin = FactoryBot.create(:active_admin)
  puts "ADMINISTRATOR: #{admin.email}"
end
