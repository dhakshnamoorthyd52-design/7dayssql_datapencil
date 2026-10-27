create database 7dayssql_chellenge;
use 7dayssql_chellenge;

-- customers

create table customers(
customer_id int primary key,
full_name varchar(100) not null,
email varchar(100) not null,
city varchar(50) not null,
signup_date date not null,
segment varchar(20) not null);

-- products

create table products(
product_id int primary key,
product_name varchar(40),
category varchar(40),
price decimal(10,2),
cost decimal(10,2)
);

-- orders

CREATE TABLE orders (
order_id INT primary key,
 customer_id int not null,
 order_date DATE NOT NULL,
 status VARCHAR(20),
 channel VARCHAR(20),
    
 FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- order_items

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- deliveries

CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY,
    order_id INT NOT NULL UNIQUE,
    dispatch_date DATE,
    delivery_date DATE not null,
    delivery_status VARCHAR(20)
    );
    
    -- payments
    
    CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    amount DECIMAL(10,2),
    
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

load data









