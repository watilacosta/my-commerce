# Generate product categories

if Rails.env.development?
  puts 'CREATING ADMIN USER'
  user = FactoryBot.create(:active_admin)
  context = GenerateConfirmationCode.call(user:)
  puts "email: #{user.email}, code: #{context.confirmation_code}"
end
