# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create users
puts "Creating users..."
user1 = User.find_or_create_by!(email: "john@example.com") do |user|
  user.password = "password123"
  user.password_confirmation = "password123"
end

user2 = User.find_or_create_by!(email: "jane@example.com") do |user|
  user.password = "password123"
  user.password_confirmation = "password123"
end

user3 = User.find_or_create_by!(email: "admin@example.com") do |user|
  user.password = "password123"
  user.password_confirmation = "password123"
end

puts "Created #{User.count} users"

# Create blogs
puts "Creating blogs..."

Blog.find_or_create_by!(title: "Introduction to Ruby on Rails", user: user1) do |blog|
  blog.content = "Ruby on Rails is a web application framework written in Ruby. It's designed to make programming web applications easier by making assumptions about what every developer needs to get started."
end

Blog.find_or_create_by!(title: "Understanding Devise Authentication", user: user1) do |blog|
  blog.content = "Devise is a flexible authentication solution for Rails based on Warden. It provides a complete MVC solution based on Rails engines with modules for email confirmation, password recovery, and more."
end

Blog.find_or_create_by!(title: "RESTful API Design Best Practices", user: user2) do |blog|
  blog.content = "REST APIs are the backbone of modern web applications. Learn about the best practices for designing scalable and maintainable RESTful APIs including proper HTTP methods, status codes, and resource naming."
end

Blog.find_or_create_by!(title: "Getting Started with Active Record", user: user2) do |blog|
  blog.content = "Active Record is the Object-Relational Mapping (ORM) layer supplied with Rails. It connects classes to relational database tables to establish a persistence layer for the application."
end

Blog.find_or_create_by!(title: "Securing Your Rails Application", user: user3) do |blog|
  blog.content = "Security is paramount in web development. This post covers essential security practices in Rails including SQL injection prevention, CSRF protection, and secure password storage."
end

puts "Created #{Blog.count} blogs"
puts "Seeding completed successfully!"
