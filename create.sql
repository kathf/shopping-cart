create table products (
  id serial primary key,
  name text,
  price_x_gst money,
  gst money,
  total_price money,
  stock int
);

create table transactions (
  id serial primary key,
  amount_x_gst money,
  amount_gst money,
  total_amount money,
  purchase_date timestamp
);

create table transaction_details (
  id serial primary key not null,
  product_id int references products(id),
  transaction_id int references transactions(id)
);
