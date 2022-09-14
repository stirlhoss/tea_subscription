# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Subscription.destroy_all
Customer.destroy_all
Tea.destroy_all

Customer.create!(first_name: 'Brian', last_name: 'Zanti', email: 'brian@email.com', address: '12345 Pwahoo Ln., Arvada CO 80001')
Customer.create!(first_name: 'James', last_name: 'Baker', email: 'james@email.com', address: '135 Jordan Way, Arvada CO 80001')

Tea.create!(title: 'Tea 1', description: 'A real nice beverage.', temperature: '201', brew_time: '2')
Tea.create!(title: 'Tea 2', description: 'A real nice beverage.', temperature: '202', brew_time: '2')
Tea.create!(title: 'Tea 3', description: 'A real nice beverage.', temperature: '203', brew_time: '2')

Subscription.create!(title: 'a tea a day', price: 25.55, status: 'Active', frequency: 12, customer_id: Customer.first.id, tea_id: Tea.first.id)
Subscription.create!(title: 'a new day', price: 25.55, status: 'Canceled', frequency: 12, customer_id: Customer.first.id, tea_id: Tea.last.id)
