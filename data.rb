#You can use n.times to execute some code many times
#You can use rand(n) to generate a number between 0 and n
#You can use Time.new and the to_s method to generate a timestamp (try to use different times)



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

#generates product table with calculated dat item
products.each_with_index do |arr, index|
  product_details << [index+1, arr[0], (1.17*rand(7.98))+0.01 , arr[1]]
end

product_details.each do |elem|
  puts "INSERT INTO products (name, price, gst_flag) VALUES ('#{elem[1]}',#{elem[2]},#{elem[3]});"
end

#generate 350 transactions with a purchase date
350.times do
  puts "INSERT INTO transactions (purchase_date) VALUES ('#{Time.at(1420030800+rand(10371600))}');"
end

#generate 1000 data items into the transaction_details spreadsheet, referencing product_ids 1-10 and one of 350 transaction_ids
1000.times do
  puts "INSERT INTO transaction_details (product_id, transaction_id) VALUES (#{1+rand(9)},#{1+rand(349)});"
end
