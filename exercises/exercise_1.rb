require_relative '../setup'

puts "Exercise 1"
puts "----------"

# Your code goes below here ...

# Using the new method, an object can be instantiated without being saved. A call to user.save will commit the record to the database.
burnaby = Store.new
burnaby.name = "Burnaby"
burnaby.annual_revenue = 300000
burnaby.mens_apparel = true
burnaby.womens_apparel = true
burnaby.save

# the create method call will create and save a new record into the database
richmond = Store.create(
  name: "Richmond",
  annual_revenue: 1260000,
  mens_apparel: false,
  womens_apparel: true
)

# Block: both create and new will yield the new object to that block for initialization
gastown = Store.new do |store|
  store.name = "Gastown"
  store.annual_revenue = 190000
  store.mens_apparel = true
  store.womens_apparel = false
  store.save
end

puts Store.count