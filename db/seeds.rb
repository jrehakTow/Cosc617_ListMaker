# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
List.create([{ name: 'Groceries' }, { name: 'Home Improvement' }])

Item.create([{name: 'apple', quantity: 2, list_id: 1}, {name: 'banana', quantity: 1, list_id: 1}, {name: 'hammer', quantity: 2, list_id: 2}])