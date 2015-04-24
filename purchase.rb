class Purchase < Database

  def available_products
    res = self.class.connection.exec("SELECT * FROM products ORDER BY id")
    result_array = []
    res.each do |row|
      result_array << {
      id: row['id'],
      name: row['name'],
      total_price: row['total_price'],
      stock: row['stock']}
    end
    return result_array
  end

  def disp_available_products
    puts "\n==== AVAILABLE PRODUCTS ===="
    puts "#{printf("%-8s",'ID')} #{printf("%-16s",'Name')} #{printf("%-12s",'Price')} #{printf("%-12s",'Available Stock')}"
    available_products.each do |hash|
      puts "#{printf("%-8s",hash[:id])} #{printf("%-16s",hash[:name])} #{printf("%-12s",hash[:total_price])} #{printf("%-12s",hash[:stock])}"
    end
    puts "=========================="
  end

  def select_prod
    puts "\nPlease select product number to add to trolley."
    print "Product number: "
  end

  def product_id_lookup(id)
    res = self.class.connection.exec("SELECT * FROM products WHERE id = $1", [id])
    result_hash = (res[0])
    #can add error msg if non-existent product id returned
  end

# product_to_add is an array of hashes!!!

  def select_qty(hash)
    print "Quantity of #{hash['name']}s: "
  end

  def confirmation(hash)
    puts "#{hash['name'][0].upcase}#{hash['name'][1..50]} added to your cart (quantity #{hash['purchase_qty']})."
  end

end

__END__
