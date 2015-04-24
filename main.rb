#Building on your transactions database, re-implement your shopping cart.
  #You should save your purchases as transactions
  #You may wish to create a table called transaction items to allow multiple items in a sale
  #You should use your database for all relevant operations
  #Create a new project in Git and use regular commits

require 'rubygems'
require 'pg'
require './database.rb'
require './shopping_cart.rb'
require './purchase.rb'
require './checkout.rb'

Database.connection(dbname: 'shoppingdb')

$product_to_add = []

#new instance of shopping cart
shopping_cart = ShoppingCart.new

shopping_cart.welcome1
shopping_cart.welcome2
shopping_cart.selection(gets.to_i)
