create table products (
  id serial primary key,
  name text,
  price money,
  gst_flag int
);

create table transactions (
  id serial primary key,
--#  amount money,
--# gst money,
--#  total money
  purchase_date timestamp
);

create table transaction_details (
  id serial primary key not null,
  product_id int references products(id),
  transaction_id int references transactions(id)
);
