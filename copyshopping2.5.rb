# 14/4/15

def welcome
  puts "\nHello! Welcome to shopping world."
end

def options
  puts "\nWhat would you like to do today?\n1. View available products\n2. Search for product by name\n3. Review purchases and checkout\n[Press \"R\" to return to main menu at any time]."
  print "\nSelection: "
end

def display(products)
  puts "\nAvailable products:"
  products.each {|hash| puts "#{hash[:id]}. #{hash[:prod]} ($#{sprintf("%.2f", hash[:price])}ea - #{hash[:qty]} available)"}
end

def select_prod
  puts "\nPlease select product number to add to trolley"
  print "Product number: "
end

def select_qty(product_to_add)
  print "Quantity of #{product_to_add[:prod]}s: "
end

#remove from available products list
#def decrement!(products, input_id, input_qty)
#  products.map! do |hash|
#    do hash[:qty] = 4
#      #-= input_qty if hash[:id] == input_id
#  end
#end


#add prod to trolley
def add_to_trolley(trolley, product_to_add)
  trolley << product_to_add
  puts "\n#{input[0]} (x#{input_qty}) successfully added to trolley!"
end

def another()
  print "Would you like to add another product?\n(\"y/n\")"
  anoth = gets.chomp
end

def prod_select(products, input, trolley)
  if input > 0 && !products.include?(input)
    print "That was not a valid selection. Please choose again:"
    input = gets.to_i
  end

  if products.include?(input)

  end
  #if
    # add responce for product already added to trolley
  #end
  if input == 0
    puts "\n**Return to main menu**."
  end
end

def view_trol (trolley)
  puts "\nTrolley:"
  trolley.each {|elem| puts "#{elem[2]} x #{elem[0]} at $#{sprintf("%.2f", elem[1])}ea"}
  sum = 0
  trolley.each {|elem| sum += (elem[2] * elem[1])}
  puts "____________________\nTotal - $#{sprintf("%.2f", sum)}"
end

#method to change product selection


############################################################

products = [
  {id: 1, prod: 'Apple', price: 4.20, qty: 3},
  {id: 2, prod: 'Pear', price: 2.70, qty: 1},
  {id: 3, prod: 'Banana', price: 1.30, qty: 12},
  {id: 4, prod: 'Musesli', price: 3.10, qty: 2},
  {id: 5, prod: 'Yoghurt', price: 5.60, qty: 95},
]

trolley = []

welcome

# "R" to return to main menu."

  options
  case gets.to_i
    when 1
      display(products)
      select_prod
      input_id = gets.to_i
      product_to_add = products.find {|hashes| hashes[:id] = input_id }
      select_qty(product_to_add)
      input_qty = gets.to_i
      product_to_add[:purchase_qty] = input_qty
      puts product_to_add
      #decrement!(products, input_id, input_qty)
      #puts display(products)

      #add(input, products, trolley)
    when 2
      puts "something"
  end

=begin
    when 2
      puts "Please enter product name: "
      product_name = gets.chomp
    when 3
      view_trol(trolley)
      puts "\"Y\" to checkout or any letter to return to the main menu?"
      input3 = gets.chomp
      if input3 == "y" || input3 == "Y"
        puts "Thankyou for your payment. Come back soon!"
        exit
      else
        puts "\n**Return to main menu**."
      end
    else
      puts "\n** Please enter (1-3) only **"
=end
