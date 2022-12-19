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
end
