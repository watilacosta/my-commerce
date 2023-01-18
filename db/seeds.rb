# Generate product categories

if Rails.env.development?
  puts 'CREATING PRODUCTS CATEGORIES'
  20.times do
    FactoryBot.create(:category)
  end

  puts 'CREATING ADMIN USER'
  admin = FactoryBot.create(:active_admin)
  puts "ADMINISTRATOR: #{admin.email}"

  puts 'CREATING BRANDS'
  10.times do
    FactoryBot.create(:brand)
  end

  puts 'CREATING CUSTOMERS'
  100.times do |i|
    FactoryBot.create(:user)
    puts "#{i} - #{User.last.email}"
  end

  puts 'CREATING PRODUCTS'
  200.times do |i|
    brands ||= Brand.all
    categories ||= Category.all
    product = FactoryBot.create(:product, brand: brands.sample, category: categories.sample)
    puts "#{1} - #{product.title}"
  end
end
