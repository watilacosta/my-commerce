# Generate product categories

if Rails.env.development?
  puts 'CREATING PRODUCTS CATEGORIES'
  20.times do
    FactoryBot.create(:category)
  end

  puts 'CREATING ADMIN USER'
  user = FactoryBot.create(:active_admin)
  context = GenerateConfirmationCode.call(user:)
  puts "email: #{user.email}, code: #{context.confirmation_code}"

  puts 'CREATING BRANDS'
  10.times do
    FactoryBot.create(:brand)
  end

  puts 'CREATING CUSTOMERS'
  100.times do |i|
    user = FactoryBot.create(:user)
    context = GenerateConfirmationCode.call(user:)
    puts "#{i + 1} - email: #{User.last.email}, code: #{context.confirmation_code}"
  end

  puts 'CREATING PRODUCTS'
  200.times do |i|
    brands ||= Brand.all
    categories ||= Category.all
    product = FactoryBot.create(:product, brand: brands.sample, category: categories.sample)
    puts "#{1} - #{product.title}"
  end
end
