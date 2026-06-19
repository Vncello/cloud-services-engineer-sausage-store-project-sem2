-- Осуществляем нормализацию данных:

-- 1. Добавляем дополнительные колонки и PK в таблицы orders и product

-- orders
ALTER TABLE orders ADD COLUMN date_created date default current_date;
ALTER TABLE orders ADD PRIMARY KEY (id);

-- product
ALTER TABLE product ADD COLUMN price double precision; 
ALTER TABLE product ADD PRIMARY KEY (id);

-- 2. Удаляем ненужные таблицы orders_date и product_info

DROP TABLE IF EXISTS orders_date;
DROP TABLE IF EXISTS product_info;

-- 3. Добавляем FK для таблицы order_product

ALTER TABLE order_product ADD FOREIGN KEY (order_id) REFERENCES orders (id);
ALTER TABLE order_product ADD FOREIGN KEY (product_id) REFERENCES product (id);

