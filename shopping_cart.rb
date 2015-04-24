rename this class

add attr accessor with empty array


class ShoppingCart

  def welcome1
    puts "===============================\nWelcome to shopping world!\nWhat would you like to do today?"
  end

  def welcome2
    puts "Options:
1. Make a purchase
2. View your cart and checkout
3. Admin area (**password required**)"
    #optional: 3a. Check stock levels\n3b. Replenish stock\nMonthly sales report
    print "\nSelection (1-3): "
  end

  def selection(option)
    case option
      when 1
        self.purchase
      when 2
        self.checkout
      when 3
        put "option 3"
      end
  end

    def purchase
      puts "\nMake a purchase. Excellent choice!"
      purchase1 = Purchase.new
      purchase1.disp_available_products
      purchase1.select_prod
      input_id = gets.to_i #returns hash of product details
      $product_to_add << purchase1.product_id_lookup(input_id)
      purchase1.select_qty($product_to_add[0])
      input_qty = gets.to_i
      $product_to_add[0]['purchase_qty'] = input_qty
      purchase1.confirmation($product_to_add[0])
      another
  #    return product_to_add ###not working - needs to pass out the array of products to purch
    end

    def checkout
      checkout1 = Checkout.new
      checkout1.display_cart

      puts "end of option 2"
    end



    #method to decrement after checkout


    def another
      print "Would you like to add another product?\n(\"y/n\")"
      response = gets.chomp
      if response == "y"
        self.selection(1)
        else
        self.welcome2
        self.selection(gets.to_i)
      end
    end

end

#exceptions for exceed product stock etc
