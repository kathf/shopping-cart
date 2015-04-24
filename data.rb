#You can use n.times to execute some code many times
#You can use rand(n) to generate a number between 0 and n
#You can use Time.new and the to_s method to generate a timestamp (try to use different times)


#array of products [name, gst_flag]
products = [
  ['apple', 0],
  ['pear', 0],
  ['banana', 0],
  ['turnip', 0],
  ['celery', 0],
  ['chips', 1],
  ['socks', 1],
  ['rice', 1],
  ['chocolate', 1],
  ['milo', 1]]

product_details = []

#create product table with random generated price and calculates gst and total price
products.each_with_index do |arr, index|
  pr = 2+(1.17*rand(10))
  gst = pr*arr[1]*0.1
  product_details << [index+1, arr[0], pr , gst , (pr + gst), 17+rand(200)]
end

product_details.each do |elem|
  puts "INSERT INTO products (name, price_x_gst, gst, total_price, stock) VALUES ('#{elem[1]}', #{elem[2]}, #{elem[3]}, #{elem[4]}, #{elem[5]});"
end

#generate 350 transactions with a purchase date
350.times do
  puts "INSERT INTO transactions (purchase_date) VALUES ('#{Time.at(1420030800+rand(10371600))}');"
end

#generate 1000 data items into the transaction_details spreadsheet, referencing product_ids 1-10 and one of 350 transaction_ids
1000.times do
  puts "INSERT INTO transaction_details (product_id, transaction_id) VALUES (#{1+rand(9)},#{1+rand(349)});"
end

__END__
### Generate extra data items into transactions table, based on some of transaction_details....

"INSERT INTO transactions (amount_x_gst)


  amount_x_gst money,
  amount_gst money,
  total_amount money,
