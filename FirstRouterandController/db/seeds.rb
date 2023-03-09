# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ApplicationRecord.transaction do

  puts "destroying table"
  User.destroy_all

  puts "resetting ID sequences"
  %w(users).each do |table|
    ApplicationRecord.connection.reset_pk_sequence!(table)
  end

  puts "creating seed data"
  u1 = User.create!(name: 'Darren', email: 'deid@gmail.com')
  u2 = User.create!(name: 'Taylor', email: 'tmustof@gmail.com')
  u3 = User.create!(name: 'Diego', email: 'dchavez@gmail.com')

end