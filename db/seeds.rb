require 'open-uri'

# Clear existing data
AdminUser.destroy_all
Customer.destroy_all

# Seed data
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

NUMBER_OF_CUSTOMERS = 5

NUMBER_OF_CUSTOMERS.times do
  customer = Customer.create!(
    full_name: Faker::Name.unique.name,
    email: Faker::Internet.unique.email,
    phone_number: Faker::PhoneNumber.phone_number,
    notes: Faker::Lorem.sentence
  )

  query = URI.encode_www_form_component(customer.full_name)
  downloaded_image = URI.open("https://source.unsplash.com/100x100/?#{query}")
  customer.image.attach(io: downloaded_image, filename: "#{customer.full_name.parameterize}.jpg")
end

puts "Created #{Customer.count} Customers."
