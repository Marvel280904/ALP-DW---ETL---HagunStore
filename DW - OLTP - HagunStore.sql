drop database if exists branch1;
create database branch1;
use branch1;

drop table if exists customer;
CREATE TABLE IF NOT EXISTS customer (
    customer_id VARCHAR(8) PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    `password` VARCHAR(30),
	is_warehouse BOOL DEFAULT 0
);

drop table if exists cart;
CREATE TABLE cart (
    id_cart VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(8) references customer(customer_id),
    product_id varchar(8) references product(product_id),
    product_price INT,
    is_warehouse BOOL DEFAULT 0
);

drop table if exists wishlist;
CREATE TABLE wishlist (
    id_wishlist VARCHAR(10) PRIMARY KEY,
    product_id varchar(8) references product(product_id),
    is_warehouse BOOL DEFAULT 0
);

INSERT INTO cart (id_cart, customer_id, product_id, product_price, is_warehouse) VALUES
('C00001', 'CU000001', 'PR000001', 2000000, 0),
('C00002', 'CU000003', 'PR000003', 2100000, 0),
('C00003', 'CU000004', 'PR000004', 900000, 0),
('C00004', 'CU000005', 'PR000005', 1000000, 0),
('C00005', 'CU000006', 'PR000006', 1100000, 0),
('C00006', 'CU000010', 'PR000010', 1200000, 0),
('C00007', 'CU000012', 'PR000012', 900000, 0),
('C00008', 'CU000014', 'PR000014', 1300000, 0),
('C00009', 'CU000016', 'PR000016', 1000000, 0),
('C00010', 'CU000017', 'PR000017', 1000000, 0),
('C00011', 'CU000018', 'PR000018', 900000, 0),
('C00012', 'CU000020', 'PR000020', 1600000, 0);

INSERT INTO wishlist (id_wishlist, product_id, is_warehouse) VALUES
('W00001', 'PR000002', 0),
('W00002', 'PR000003', 0),
('W00003', 'PR000006', 0),
('W00004', 'PR000008', 0),
('W00005', 'PR000009', 0),
('W00006', 'PR000011', 0),
('W00007', 'PR000012', 0),
('W00008', 'PR000014', 0),
('W00009', 'PR000015', 0),
('W00010', 'PR000016', 0),
('W00011', 'PR000017', 0),
('W00012', 'PR000020', 0);

drop table if exists product;
CREATE TABLE IF NOT EXISTS product (
    product_id varchar(8) PRIMARY KEY,
    `name` VARCHAR(100),
    brand VARCHAR(100),
    color VARCHAR(50),
    category VARCHAR(100),
    gender VARCHAR(10),
    product_price INT,
    picture VARCHAR(100)
);

drop table if exists product_inventory;
CREATE TABLE IF NOT EXISTS product_inventory (
    productinventory_Id VARCHAR(8) PRIMARY KEY,
    product_id varchar(8),
    size VARCHAR(10),
    stock INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

drop table if exists `order`;
CREATE TABLE IF NOT EXISTS `order` (
  order_id VARCHAR(11) PRIMARY KEY,
  customer_id VARCHAR(8) NOT NULL,
  order_date DATE NOT NULL,
  total_price INT NOT NULL,
  is_warehouse BOOL DEFAULT 0,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

drop table if exists order_detail;
CREATE TABLE IF NOT EXISTS order_detail (
  orderdetail_id VARCHAR(11) PRIMARY KEY,
  order_id VARCHAR(11) NOT NULL,
  product_id VARCHAR(8) NOT NULL,
  size VARCHAR(10),
  quantity INT NOT NULL,
  product_price INT NOT NULL,  
  is_warehouse BOOL DEFAULT 0,
  FOREIGN KEY (order_id) REFERENCES `order`(order_id),
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);



-- Inserting sample data into the product table
INSERT INTO product (product_id, `name`, brand, color, category, gender, product_price, picture)
VALUES 
('PR000001', 'Air Jordan True Blue', 'Nike', 'Blue', 'Sports', 'Male', 2000000, 'picture1'),
('PR000002', 'Air Jordan Bred', 'Nike', 'Black', 'Sports', 'Male', 1900000, 'picture2'),
('PR000003', 'Air Jordan Space Jam', 'Nike', 'Black', 'Sports', 'Male', 2100000, 'picture3'),
('PR000004', 'Air Force 1 Low', 'Nike', 'White', 'Casual', 'Male', 900000, 'picture4'),
('PR000005', 'Air Force 1 High', 'Nike', 'Black', 'Casual', 'Male', 1000000, 'picture5'),
('PR000006', 'Blazer Mid 77', 'Nike', 'Red', 'Casual', 'Female', 1100000, 'picture6'),
('PR000007', 'Cortez Basic Leather', 'Nike', 'White', 'Casual', 'Female', 800000, 'picture7'),
('PR000008', 'Air Max 90', 'Nike', 'Black', 'Sports', 'Male', 1300000, 'picture8'),
('PR000009', 'Air Max 97', 'Nike', 'Silver', 'Sports', 'Male', 1700000, 'picture9'),
('PR000010', 'React Element 55', 'Nike', 'Volt', 'Casual', 'Female', 1200000, 'picture10'),
('PR000011', 'Superstar', 'Adidas', 'White', 'Casual', 'Female', 800000, 'picture11'),
('PR000012', 'Stan Smith', 'Adidas', 'White', 'Casual', 'Female', 900000, 'picture12'),
('PR000013', 'Ultra Boost', 'Adidas', 'Black', 'Sports', 'Male', 1800000, 'picture13'),
('PR000014', 'NMD_R1', 'Adidas', 'Black', 'Casual', 'Female', 1300000, 'picture14'),
('PR000015', 'Yeezy Boost 350 V2', 'Adidas', 'Sesame', 'Casual', 'Male', 2300000, 'picture15'),
('PR000016', 'Alphabounce Beyond', 'Adidas', 'Grey', 'Sports', 'Male', 1000000, 'picture16'),
('PR000017', 'Gazelle', 'Adidas', 'Blue', 'Casual', 'Female', 1000000, 'picture17'),
('PR000018', 'Continental 80', 'Adidas', 'Off White', 'Casual', 'Female', 900000, 'picture18'),
('PR000019', 'Samba Classic', 'Adidas', 'Black', 'Casual', 'Male', 700000, 'picture19'),
('PR000020', 'Originals Nite Jogger', 'Adidas', 'Solar Orange', 'Casual', 'Male', 1600000, 'picture20');

-- Inserting sample data into the product_inventory table
INSERT INTO product_inventory (productinventory_Id, product_id, size, stock)
VALUES 
('PI000001', 'PR000001', '40', 10),
('PI000002', 'PR000001', '41', 0),
('PI000003', 'PR000001', '42', 20),
('PI000004', 'PR000001', '43', 25),
('PI000005', 'PR000001', '45', 12),
('PI000006', 'PR000002', '40', 5),
('PI000007', 'PR000002', '41', 18),
('PI000008', 'PR000002', '42', 0),
('PI000009', 'PR000002', '43', 25),
('PI000010', 'PR000002', '45', 10),
('PI000011', 'PR000003', '40', 15),
('PI000012', 'PR000003', '41', 0),
('PI000013', 'PR000003', '42', 18),
('PI000014', 'PR000003', '43', 0),
('PI000015', 'PR000003', '45', 8),
('PI000016', 'PR000004', '40', 8),
('PI000017', 'PR000004', '41', 10),
('PI000018', 'PR000004', '42', 0),
('PI000019', 'PR000004', '43', 20),
('PI000020', 'PR000004', '45', 5),
('PI000021', 'PR000005', '40', 10),
('PI000022', 'PR000005', '41', 15),
('PI000023', 'PR000005', '42', 0),
('PI000024', 'PR000005', '43', 25),
('PI000025', 'PR000005', '45', 12),
('PI000026', 'PR000006', '40', 20),
('PI000027', 'PR000006', '41', 18),
('PI000028', 'PR000006', '42', 22),
('PI000029', 'PR000006', '43', 0),
('PI000030', 'PR000006', '45', 10),
('PI000031', 'PR000007', '40', 0),
('PI000032', 'PR000007', '41', 12),
('PI000033', 'PR000007', '42', 18),
('PI000034', 'PR000007', '43', 20),
('PI000035', 'PR000007', '45', 8),
('PI000036', 'PR000008', '40', 8),
('PI000037', 'PR000008', '41', 0),
('PI000038', 'PR000008', '42', 15),
('PI000039', 'PR000008', '43', 20),
('PI000040', 'PR000008', '45', 5),
('PI000041', 'PR000009', '40', 10),
('PI000042', 'PR000009', '41', 0),
('PI000043', 'PR000009', '42', 20),
('PI000044', 'PR000009', '43', 25),
('PI000045', 'PR000009', '45', 12),
('PI000046', 'PR000010', '40', 20),
('PI000047', 'PR000010', '41', 0),
('PI000048', 'PR000010', '42', 22),
('PI000049', 'PR000010', '43', 25),
('PI000050', 'PR000010', '45', 0),
('PI000051', 'PR000011', '40', 15),
('PI000052', 'PR000011', '41', 12),
('PI000053', 'PR000011', '42', 0),
('PI000054', 'PR000011', '43', 20),
('PI000055', 'PR000011', '45', 8),
('PI000056', 'PR000012', '40', 8),
('PI000057', 'PR000012', '41', 0),
('PI000058', 'PR000012', '42', 15),
('PI000059', 'PR000012', '43', 20),
('PI000060', 'PR000012', '45', 5),
('PI000061', 'PR000013', '40', 0),
('PI000062', 'PR000013', '41', 15),
('PI000063', 'PR000013', '42', 20),
('PI000064', 'PR000013', '43', 25),
('PI000065', 'PR000013', '45', 12),
('PI000066', 'PR000014', '40', 20),
('PI000067', 'PR000014', '41', 18),
('PI000068', 'PR000014', '42', 22),
('PI000069', 'PR000014', '43', 0),
('PI000070', 'PR000014', '45', 10),
('PI000071', 'PR000015', '40', 15),
('PI000072', 'PR000015', '41', 12),
('PI000073', 'PR000015', '42', 0),
('PI000074', 'PR000015', '43', 20),
('PI000075', 'PR000015', '45', 8),
('PI000076', 'PR000016', '40', 8),
('PI000077', 'PR000016', '41', 0),
('PI000078', 'PR000016', '42', 15),
('PI000079', 'PR000016', '43', 20),
('PI000080', 'PR000016', '45', 5),
('PI000081', 'PR000017', '40', 0),
('PI000082', 'PR000017', '41', 15),
('PI000083', 'PR000017', '42', 20),
('PI000084', 'PR000017', '43', 25),
('PI000085', 'PR000017', '45', 12),
('PI000086', 'PR000018', '40', 20),
('PI000087', 'PR000018', '41', 18),
('PI000088', 'PR000018', '42', 0),
('PI000089', 'PR000018', '43', 25),
('PI000090', 'PR000018', '45', 10),
('PI000091', 'PR000019', '40', 0),
('PI000092', 'PR000019', '41', 12),
('PI000093', 'PR000019', '42', 18),
('PI000094', 'PR000019', '43', 0),
('PI000095', 'PR000019', '45', 8),
('PI000096', 'PR000020', '40', 8),
('PI000097', 'PR000020', '41', 0),
('PI000098', 'PR000020', '42', 15),
('PI000099', 'PR000020', '43', 20),
('PI000100', 'PR000020', '45', 5);

INSERT INTO customer (customer_id, name, email, phone, password, is_warehouse)
VALUES
('CU000001', 'JohnDoe', 'johndoe@gmail.com', '1234567890', 'password123', 0),
('CU000002', 'JaneSmith', 'janesmith@yahoo.com', '0987654321', 'password456', 0),
('CU000003', 'BobJohnson', 'bobjohnson@hotmail.com', '1112223333', 'password789', 0),
('CU000004', 'AliceBrown', 'alicebrown@outlook.com', '4445556666', 'password000', 0),
('CU000005', 'CharlieDavis', 'charliedavis@gmail.com', '2223334444', 'password111', 0),
('CU000006', 'EmilyEvans', 'emilyevans@yahoo.com', '3334445556', 'password222', 0),
('CU000007', 'GeorgeHarris', 'georgeharris@hotmail.com', '4445556666', 'password333', 0),
('CU000008', 'HannahClark', 'hannahclark@outlook.com', '5556667777', 'password444', 0),
('CU000009', 'IanScott', 'ianscott@gmail.com', '6667778888', 'password555', 0),
('CU000010', 'JessicaTurner', 'jessicaturner@yahoo.com', '7778889999', 'password666', 0),
('CU000011', 'KevinWalker', 'kevinwalker@hotmail.com', '8889990000', 'password777', 0),
('CU000012', 'LauraMartin', 'lauramartin@gmail.com', '9990001111', 'password888', 0),
('CU000013', 'MichaelLee', 'michaellee@yahoo.com', '0001112222', 'password999', 0),
('CU000014', 'NatalieMoore', 'nataliemoore@hotmail.com', '1112223334', 'password101', 0),
('CU000015', 'OliverKing', 'oliverking@outlook.com', '2223334445', 'password202', 0),
('CU000016', 'PatriciaGreen', 'patriciagreen@gmail.com', '3334445556', 'password303', 0),
('CU000017', 'QuincyAdams', 'quincyadams@yahoo.com', '4445556667', 'password404', 0),
('CU000018', 'RachelWhite', 'rachelwhite@hotmail.com', '5556667778', 'password505', 0),
('CU000019', 'SamuelBlack', 'samuelblack@outlook.com', '6667778889', 'password606', 0),
('CU000020', 'TinaBlue', 'tinablue@gmail.com', '7778889990', 'password707', 0);

INSERT INTO `order` (order_id, customer_id, order_date, total_price, is_warehouse)
VALUES
('A2023050101', 'CU000001', '2023-05-01', 4000000, 0),
('A2023050201', 'CU000001', '2023-05-02', 900000, 0),
('A2023050301', 'CU000003', '2023-05-03 ', 6000000, 0),
('A2023050401', 'CU000004', '2023-05-04 ', 2000000, 0),
('A2023050501', 'CU000005', '2023-05-05 ', 2300000, 0),
('A2023050701', 'CU000005', '2023-05-07 ', 3400000, 0),
('A2023050801', 'CU000005', '2023-05-08 ', 2000000, 0),
('A2023050901', 'CU000008', '2023-05-09 ', 4000000, 0),
('A2023051101', 'CU000008', '2023-05-11 ', 2000000, 0),
('A2023051201', 'CU000010', '2023-05-12 ', 1900000, 0),
('A2023051301', 'CU000011', '2023-05-13 ', 1900000, 0),
('A2023051401', 'CU000012', '2023-05-14 ', 1800000, 0),
('A2023051501', 'CU000013', '2023-05-15 ', 1900000, 0),
('A2023051601', 'CU000014', '2023-05-16 ', 1900000, 0),
('A2023051701', 'CU000015', '2023-05-17 ', 1600000, 0),
('A2023051801', 'CU000016', '2023-05-18 ', 1000000, 0),
('A2023051901', 'CU000017', '2023-05-19 ', 2100000, 0),
('A2023052001', 'CU000018', '2023-05-20 ', 1800000, 0),
('A2023052101', 'CU000019', '2023-05-21 ', 2100000, 0),
('A2023052201', 'CU000019', '2023-05-22 ', 2100000, 0),
('A2023052301', 'CU000019', '2023-05-23', 2100000, 0),
('A2023052401', 'CU000019', '2023-05-24', 900000, 0),
('A2023052501', 'CU000020', '2023-05-25', 2100000, 0),
('A2023052601', 'CU000020', '2023-05-26', 2100000, 0),
('A2023052701', 'CU000020', '2023-05-27', 1000000, 0);


-- Inserting sample data into the order_detail table
INSERT INTO order_detail (orderdetail_id, order_id, product_id, size, quantity, product_price, is_warehouse)
VALUES
('OR00001', 'A2023050101', 'PR000001', '40', 2, 2000000, 0),
('OR00002', 'A2023050201', 'PR000012', '43', 1, 900000, 0),
('OR00003', 'A2023050301', 'PR000001', '40', 3, 2000000, 0),
('OR00004', 'A2023050401', 'PR000001', '40', 1, 2000000, 0),
('OR00005', 'A2023050501', 'PR000015', '43', 1, 2300000, 0),
('OR00006', 'A2023050701', 'PR000009', '42', 2, 1700000, 0),
('OR00007', 'A2023050801', 'PR000001', '40', 1, 2000000, 0),
('OR00008', 'A2023050901', 'PR000001', '40', 2, 2000000, 0),
('OR00009', 'A2023051101', 'PR000001', '40', 1, 2000000, 0),
('OR00010', 'A2023051201', 'PR000002', '40', 1, 1900000, 0),
('OR00011', 'A2023051301', 'PR000002', '40', 1, 1900000, 0),
('OR00012', 'A2023051401', 'PR000018', '41', 2, 900000, 0),
('OR00013', 'A2023051501', 'PR000002', '40', 1, 1900000, 0),
('OR00014', 'A2023051601', 'PR000002', '40', 1, 1900000, 0),
('OR00015', 'A2023051701', 'PR000011', '43', 2, 800000, 0),
('OR00016', 'A2023051801', 'PR000017', '45', 1, 1000000, 0),
('OR00017', 'A2023051901', 'PR000003', '40', 1, 2100000, 0),
('OR00018', 'A2023052001', 'PR000013', '42', 1, 1800000, 0),
('OR00019', 'A2023052101', 'PR000003', '40', 1, 2100000, 0),
('OR00020', 'A2023052201', 'PR000003', '40', 1, 2100000, 0),
('OR00021', 'A2023052301', 'PR000003', '40', 1, 2100000, 0),
('OR00022', 'A2023052401', 'PR000018', '43', 1, 900000, 0),
('OR00023', 'A2023052501', 'PR000003', '40', 1, 2100000, 0),
('OR00024', 'A2023052601', 'PR000003', '40', 1, 2100000, 0),
('OR00025', 'A2023052701', 'PR000016', '40', 1, 1000000, 0);




drop database if exists branch2;
create database branch2;
use branch2;

CREATE TABLE IF NOT EXISTS customer (
    customer_id VARCHAR(8) PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    `password` VARCHAR(30),
	is_warehouse BOOL DEFAULT 0
    
);

CREATE TABLE IF NOT EXISTS product (
    product_id varchar(8) PRIMARY KEY,
    `name` VARCHAR(100),
    brand VARCHAR(100),
    color VARCHAR(50),
    category VARCHAR(100),
    gender VARCHAR(10),
    product_price INT,
    picture VARCHAR(100)
    -- Add other relevant columns here
);

CREATE TABLE IF NOT EXISTS product_inventory (
    productinventory_Id VARCHAR(8) PRIMARY KEY,
    product_id varchar(8),
    size VARCHAR(10),
    stock INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

drop table if exists `order`;
CREATE TABLE IF NOT EXISTS `order` (
  order_id VARCHAR(11) PRIMARY KEY,
  customer_id VARCHAR(8) NOT NULL,
  order_date DATE NOT NULL,
  total_price INT NOT NULL,
  is_warehouse BOOL DEFAULT 0,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

drop table if exists order_detail;
CREATE TABLE IF NOT EXISTS order_detail (
  orderdetail_id VARCHAR(11) PRIMARY KEY,
  order_id VARCHAR(11) NOT NULL,
  product_id VARCHAR(8) NOT NULL,
  size varchar(10),
  quantity INT NOT NULL,
  product_price INT NOT NULL,  
  is_warehouse BOOL DEFAULT 0,
  FOREIGN KEY (order_id) REFERENCES `order`(order_id),
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE cart (
    id_cart VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(8) references customer(customer_id),
    product_id varchar(8) references product(product_id),
    product_price INT,
    is_warehouse BOOL DEFAULT 0
);

CREATE TABLE wishlist (
    id_wishlist VARCHAR(10) PRIMARY KEY,
    product_id varchar(8) references product(product_id),
    is_warehouse BOOL DEFAULT 0
);

INSERT INTO cart (id_cart, customer_id, product_id, product_price, is_warehouse) VALUES
('C10001', 'CU000001', 'PR000001', 2000000, 0),
('C10002', 'CU000002', 'PR000002', 1900000, 0),
('C10003', 'CU000003', 'PR000003', 2100000, 0),
('C10004', 'CU000004', 'PR000004', 900000, 0),
('C10005', 'CU000005', 'PR000005', 1000000, 0),
('C10006', 'CU000006', 'PR000006', 1100000, 0),
('C10007', 'CU000007', 'PR000007', 800000, 0),
('C10008', 'CU000008', 'PR000008', 1300000, 0),
('C10009', 'CU000009', 'PR000009', 1700000, 0),
('C10010', 'CU000010', 'PR000010', 1200000, 0),
('C10011', 'CU000011', 'PR000011', 800000, 0),
('C10012', 'CU000012', 'PR000012', 900000, 0);


INSERT INTO wishlist (id_wishlist, product_id, is_warehouse) VALUES
('W10001', 'PR000001', 0),
('W10002', 'PR000002', 0),
('W10003', 'PR000003', 0),
('W10004', 'PR000004', 0),
('W10005', 'PR000005', 0),
('W10006', 'PR000006', 0),
('W10007', 'PR000007', 0),
('W10008', 'PR000008', 0),
('W10009', 'PR000009', 0),
('W10010', 'PR000010', 0),
('W10011', 'PR000011', 0),
('W10012', 'PR000012', 0);


-- Inserting sample data into the product table
INSERT INTO product (product_id, `name`, brand, color, category, gender, product_price, picture)
VALUES 
('PR000001', 'Air Jordan True Blue', 'Nike', 'Blue', 'Sports', 'Male', 2000000, 'picture1'),
('PR000002', 'Air Jordan Bred', 'Nike', 'Black', 'Sports', 'Male', 1900000, 'picture2'),
('PR000003', 'Air Jordan Space Jam', 'Nike', 'Black', 'Sports', 'Male', 2100000, 'picture3'),
('PR000004', 'Air Force 1 Low', 'Nike', 'White', 'Casual', 'Male', 900000, 'picture4'),
('PR000005', 'Air Force 1 High', 'Nike', 'Black', 'Casual', 'Male', 1000000, 'picture5'),
('PR000006', 'Blazer Mid 77', 'Nike', 'Red', 'Casual', 'Female', 1100000, 'picture6'),
('PR000007', 'Cortez Basic Leather', 'Nike', 'White', 'Casual', 'Female', 800000, 'picture7'),
('PR000008', 'Air Max 90', 'Nike', 'Black', 'Sports', 'Male', 1300000, 'picture8'),
('PR000009', 'Air Max 97', 'Nike', 'Silver', 'Sports', 'Male', 1700000, 'picture9'),
('PR000010', 'React Element 55', 'Nike', 'Volt', 'Casual', 'Female', 1200000, 'picture10'),
('PR000011', 'Superstar', 'Adidas', 'White', 'Casual', 'Female', 800000, 'picture11'),
('PR000012', 'Stan Smith', 'Adidas', 'White', 'Casual', 'Female', 900000, 'picture12'),
('PR000013', 'Ultra Boost', 'Adidas', 'Black', 'Sports', 'Male', 1800000, 'picture13'),
('PR000014', 'NMD_R1', 'Adidas', 'Black', 'Casual', 'Female', 1300000, 'picture14'),
('PR000015', 'Yeezy Boost 350 V2', 'Adidas', 'Sesame', 'Casual', 'Male', 2300000, 'picture15'),
('PR000016', 'Alphabounce Beyond', 'Adidas', 'Grey', 'Sports', 'Male', 1000000, 'picture16'),
('PR000017', 'Gazelle', 'Adidas', 'Blue', 'Casual', 'Female', 1000000, 'picture17'),
('PR000018', 'Continental 80', 'Adidas', 'Off White', 'Casual', 'Female', 900000, 'picture18'),
('PR000019', 'Samba Classic', 'Adidas', 'Black', 'Casual', 'Male', 700000, 'picture19'),
('PR000020', 'Originals Nite Jogger', 'Adidas', 'Solar Orange', 'Casual', 'Male', 1600000, 'picture20');

-- Inserting sample data into the product_inventory table
INSERT INTO product_inventory (productinventory_Id, product_id, size, stock)
VALUES 
('PI000001', 'PR000001', '40', 10),
('PI000002', 'PR000001', '41', 0),
('PI000003', 'PR000001', '42', 20),
('PI000004', 'PR000001', '43', 25),
('PI000005', 'PR000001', '45', 12),
('PI000006', 'PR000002', '40', 5),
('PI000007', 'PR000002', '41', 18),
('PI000008', 'PR000002', '42', 0),
('PI000009', 'PR000002', '43', 25),
('PI000010', 'PR000002', '45', 10),
('PI000011', 'PR000003', '40', 15),
('PI000012', 'PR000003', '41', 0),
('PI000013', 'PR000003', '42', 18),
('PI000014', 'PR000003', '43', 0),
('PI000015', 'PR000003', '45', 8),
('PI000016', 'PR000004', '40', 8),
('PI000017', 'PR000004', '41', 10),
('PI000018', 'PR000004', '42', 0),
('PI000019', 'PR000004', '43', 20),
('PI000020', 'PR000004', '45', 5),
('PI000021', 'PR000005', '40', 10),
('PI000022', 'PR000005', '41', 15),
('PI000023', 'PR000005', '42', 0),
('PI000024', 'PR000005', '43', 25),
('PI000025', 'PR000005', '45', 12),
('PI000026', 'PR000006', '40', 20),
('PI000027', 'PR000006', '41', 18),
('PI000028', 'PR000006', '42', 22),
('PI000029', 'PR000006', '43', 0),
('PI000030', 'PR000006', '45', 10),
('PI000031', 'PR000007', '40', 0),
('PI000032', 'PR000007', '41', 12),
('PI000033', 'PR000007', '42', 18),
('PI000034', 'PR000007', '43', 20),
('PI000035', 'PR000007', '45', 8),
('PI000036', 'PR000008', '40', 8),
('PI000037', 'PR000008', '41', 0),
('PI000038', 'PR000008', '42', 15),
('PI000039', 'PR000008', '43', 20),
('PI000040', 'PR000008', '45', 5),
('PI000041', 'PR000009', '40', 10),
('PI000042', 'PR000009', '41', 0),
('PI000043', 'PR000009', '42', 20),
('PI000044', 'PR000009', '43', 25),
('PI000045', 'PR000009', '45', 12),
('PI000046', 'PR000010', '40', 20),
('PI000047', 'PR000010', '41', 0),
('PI000048', 'PR000010', '42', 22),
('PI000049', 'PR000010', '43', 25),
('PI000050', 'PR000010', '45', 0),
('PI000051', 'PR000011', '40', 15),
('PI000052', 'PR000011', '41', 12),
('PI000053', 'PR000011', '42', 0),
('PI000054', 'PR000011', '43', 20),
('PI000055', 'PR000011', '45', 8),
('PI000056', 'PR000012', '40', 8),
('PI000057', 'PR000012', '41', 0),
('PI000058', 'PR000012', '42', 15),
('PI000059', 'PR000012', '43', 20),
('PI000060', 'PR000012', '45', 5),
('PI000061', 'PR000013', '40', 0),
('PI000062', 'PR000013', '41', 15),
('PI000063', 'PR000013', '42', 20),
('PI000064', 'PR000013', '43', 25),
('PI000065', 'PR000013', '45', 12),
('PI000066', 'PR000014', '40', 20),
('PI000067', 'PR000014', '41', 18),
('PI000068', 'PR000014', '42', 22),
('PI000069', 'PR000014', '43', 0),
('PI000070', 'PR000014', '45', 10),
('PI000071', 'PR000015', '40', 15),
('PI000072', 'PR000015', '41', 12),
('PI000073', 'PR000015', '42', 0),
('PI000074', 'PR000015', '43', 20),
('PI000075', 'PR000015', '45', 8),
('PI000076', 'PR000016', '40', 8),
('PI000077', 'PR000016', '41', 0),
('PI000078', 'PR000016', '42', 15),
('PI000079', 'PR000016', '43', 20),
('PI000080', 'PR000016', '45', 5),
('PI000081', 'PR000017', '40', 0),
('PI000082', 'PR000017', '41', 15),
('PI000083', 'PR000017', '42', 20),
('PI000084', 'PR000017', '43', 25),
('PI000085', 'PR000017', '45', 12),
('PI000086', 'PR000018', '40', 20),
('PI000087', 'PR000018', '41', 18),
('PI000088', 'PR000018', '42', 0),
('PI000089', 'PR000018', '43', 25),
('PI000090', 'PR000018', '45', 10),
('PI000091', 'PR000019', '40', 0),
('PI000092', 'PR000019', '41', 12),
('PI000093', 'PR000019', '42', 18),
('PI000094', 'PR000019', '43', 0),
('PI000095', 'PR000019', '45', 8),
('PI000096', 'PR000020', '40', 8),
('PI000097', 'PR000020', '41', 0),
('PI000098', 'PR000020', '42', 15),
('PI000099', 'PR000020', '43', 20),
('PI000100', 'PR000020', '45', 5);

-- Inserting sample data into the customer table with updated phone numbers and passwords
INSERT INTO customer (customer_id, name, email, phone, password, is_warehouse)
VALUES
('CU100001', 'LiamAnderson', 'liam.anderson@example.com', '9876543210', 'newpass123', 0),
('CU100002', 'EmmaThompson', 'emma.thompson@example.com', '8765432109', 'newpass456', 0),
('CU100003', 'NoahMartinez', 'noah.martinez@example.com', '7654321098', 'newpass789', 0),
('CU100004', 'OliviaGarcia', 'olivia.garcia@example.com', '6543210987', 'newpass012', 0),
('CU100005', 'AvaRodriguez', 'ava.rodriguez@example.com', '5432109876', 'newpass345', 0),
('CU100006', 'WilliamMartinez', 'william.martinez@example.com', '4321098765', 'newpass678', 0),
('CU100007', 'SophiaHernandez', 'sophia.hernandez@example.com', '3210987654', 'newpass901', 0),
('CU100008', 'MasonLopez', 'mason.lopez@example.com', '2109876543', 'newpass234', 0),
('CU100009', 'IsabellaGonzalez', 'isabella.gonzalez@example.com', '1098765432', 'newpass567', 0),
('CU100010', 'JamesWilson', 'james.wilson@example.com', '0987652322', 'newpass890', 0),
('CU100011', 'MiaMartinez', 'mia.martinez@example.com', '9876543211', 'newpass1234', 0),
('CU100012', 'EthanAnderson', 'ethan.anderson@example.com', '8765432110', 'newpass5678', 0),
('CU100013', 'CharlotteJones', 'charlotte.jones@example.com', '7654321109', 'newpass9012', 0),
('CU100014', 'AlexanderBrown', 'alexander.brown@example.com', '6543211098', 'newpass3456', 0),
('CU100015', 'AmeliaDavis', 'amelia.davis@example.com', '5432110987', 'newpass7890', 0),
('CU100016', 'BenjaminMiller', 'benjamin.miller@example.com', '4321109876', 'newpass12345', 0),
('CU100017', 'HarperWilson', 'harper.wilson@example.com', '3211098765', 'newpass67890', 0),
('CU100018', 'ElijahClark', 'elijah.clark@example.com', '2109987654', 'newpass01234', 0),
('CU100019', 'AveryMitchell', 'avery.mitchell@example.com', '1098876543', 'newpass56789', 0),
('CU100020', 'LucasPerez', 'lucas.perez@example.com', '0987765432', 'newpass90123', 0);



INSERT INTO `order` (order_id, customer_id, order_date, total_price, is_warehouse)
VALUES
('B2023060101', 'CU100001', '2023-06-01 ', 1900000, 0),
('B2023060201', 'CU100002', '2023-06-02 ', 3800000, 0),
('B2023060301', 'CU100003', '2023-06-03 ', 6300000, 0),
('B2023060401', 'CU100004', '2023-06-04 ', 2000000, 0),
('B2023060501', 'CU100005', '2023-06-05 ', 900000, 0),
('B2023060601', 'CU100006', '2023-06-06 ', 4600000, 0),
('B2023060602', 'CU100017', '2023-06-06 ', 2000000, 0),
('B2023060701', 'CU100008', '2023-06-07', 4000000, 0),
('B2023060702', 'CU100009', '2023-06-07 ', 2000000, 0),
('B2023060703', 'CU100010', '2023-06-07 ', 1900000, 0),
('B2023060801', 'CU100011', '2023-06-08 ', 1900000, 0),
('B2023060901', 'CU100012', '2023-06-09 ', 3800000, 0),
('B2023061001', 'CU100013', '2023-06-10 ', 1800000, 0),
('B2023061101', 'CU100014', '2023-06-11 ', 1900000, 0),
('B2023061201', 'CU100015', '2023-06-12 ', 3800000, 0),
('B2023061301', 'CU100016', '2023-06-13 ', 2100000, 0),
('B2023061401', 'CU100017', '2023-06-14 ', 2100000, 0),
('B2023061501', 'CU100017', '2023-06-15 ', 2100000, 0),
('B2023061601', 'CU100017', '2023-06-16 ', 2100000, 0),
('B2023061701', 'CU100017', '2023-06-17 ', 2100000, 0),
('B2023061801', 'CU100017', '2023-06-18 ', 4000000, 0),
('B2023061901', 'CU100020', '2023-06-19 ', 1000000, 0),
('B2023062001', 'CU100020', '2023-06-20 ', 1600000, 0),
('B2023062101', 'CU100020', '2023-06-21 ', 2100000, 0),
('B2023062201', 'CU100017', '2023-06-22 ', 1000000, 0);


-- Insert sample data into the order_detail table with updated order_id
INSERT INTO order_detail (orderdetail_id, order_id, product_id, size, quantity, product_price, is_warehouse)
VALUES
('OR10001', 'B2023060101', 'PR000002', '41', 1, 1900000, 0),
('OR10002', 'B2023060201', 'PR000002', '41', 2, 1900000, 0),
('OR10003', 'B2023060301', 'PR000003', '40', 3, 2100000, 0),
('OR10004', 'B2023060401', 'PR000001', '40', 1, 2000000, 0),
('OR10005', 'B2023060501', 'PR000004', '43', 1, 900000, 0),
('OR10006', 'B2023060601', 'PR000015', '45', 2, 2300000, 0),
('OR10007', 'B2023060602', 'PR000001', '40', 1, 2000000, 0),
('OR10008', 'B2023060701', 'PR000001', '40', 2, 2000000, 0),
('OR10009', 'B2023060702', 'PR000001', '40', 1, 2000000, 0),
('OR10010', 'B2023060703', 'PR000002', '40', 1, 1900000, 0),
('OR10011', 'B2023060801', 'PR000002', '40', 1, 1900000, 0),
('OR10012', 'B2023060901', 'PR000002', '45', 2, 1900000, 0),
('OR10013', 'B2023061001', 'PR000013', '45', 1, 1800000, 0),
('OR10014', 'B2023061101', 'PR000002', '40', 1, 1900000, 0),
('OR10015', 'B2023061201', 'PR000002', '40', 2, 1900000, 0),
('OR10016', 'B2023061301', 'PR000003', '40', 1, 2100000, 0),
('OR10017', 'B2023061401', 'PR000015', '45', 2, 2300000, 0),
('OR10018', 'B2023061501', 'PR000003', '42', 1, 2100000, 0),
('OR10019', 'B2023061601', 'PR000003', '40', 1, 2100000, 0),
('OR10020', 'B2023061701', 'PR000003', '40', 1, 2100000, 0),
('OR10021', 'B2023061801', 'PR000001', '40', 2, 2000000, 0),
('OR10022', 'B2023061901', 'PR000016', '42', 1, 1000000, 0),
('OR10023', 'B2023062001', 'PR000020', '47', 1, 1600000, 0),
('OR10024', 'B2023062101', 'PR000003', '40', 1, 2100000, 0),
('OR10025', 'B2023062201', 'PR000017', '41', 1, 1000000, 0);



drop database if exists branch3;
create database branch3;
use branch3;

CREATE TABLE IF NOT EXISTS customer (
    customer_id VARCHAR(8) PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    `password` VARCHAR(30),
	is_warehouse BOOL DEFAULT 0
    
);

CREATE TABLE IF NOT EXISTS product (
    product_id varchar(8) PRIMARY KEY,
    `name` VARCHAR(100),
    brand VARCHAR(100),
    color VARCHAR(50),
    category VARCHAR(100),
    gender VARCHAR(10),
    product_price INT,
    picture VARCHAR(100)
    -- Add other relevant columns here
);

CREATE TABLE IF NOT EXISTS product_inventory (
    productinventory_Id VARCHAR(8) PRIMARY KEY,
    product_id varchar(8),
    size VARCHAR(10),
    stock INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

drop table if exists `order`;
CREATE TABLE IF NOT EXISTS `order` (
  order_id VARCHAR(11) PRIMARY KEY,
  customer_id VARCHAR(8) NOT NULL,
  order_date DATE NOT NULL,
  total_price INT NOT NULL,
  is_warehouse BOOL DEFAULT 0,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

drop table if exists order_detail;
CREATE TABLE IF NOT EXISTS order_detail (
  orderdetail_id VARCHAR(11) PRIMARY KEY,
  order_id VARCHAR(11) NOT NULL,
  product_id VARCHAR(8) NOT NULL,
  size varchar(10),
  quantity INT NOT NULL,
  product_price INT NOT NULL,  
  is_warehouse BOOL DEFAULT 0,
  FOREIGN KEY (order_id) REFERENCES `order`(order_id),
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE cart (
    id_cart VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(8) references customer(customer_id),
    product_id varchar(8) references product(product_id),
    product_price INT,
    is_warehouse BOOL DEFAULT 0
);

CREATE TABLE wishlist (
    id_wishlist VARCHAR(10) PRIMARY KEY,
    product_id varchar(8) references product(product_id),
    is_warehouse BOOL DEFAULT 0
);

INSERT INTO cart (id_cart, customer_id, product_id, product_price, is_warehouse) VALUES
('C20009', 'CU000009', 'PR000009', 1700000, 0),
('C20010', 'CU000010', 'PR000010', 1200000, 0),
('C20011', 'CU000011', 'PR000011', 800000, 0),
('C20012', 'CU000012', 'PR000012', 900000, 0),
('C20013', 'CU000013', 'PR000013', 1800000, 0),
('C20014', 'CU000014', 'PR000014', 1300000, 0),
('C20015', 'CU000015', 'PR000015', 2300000, 0),
('C20016', 'CU000016', 'PR000016', 1000000, 0),
('C20017', 'CU000017', 'PR000017', 1000000, 0),
('C20018', 'CU000018', 'PR000018', 900000, 0),
('C20019', 'CU000019', 'PR000019', 700000, 0),
('C20020', 'CU000020', 'PR000020', 1600000, 0);



INSERT INTO wishlist (id_wishlist, product_id, is_warehouse) VALUES
('W20009', 'PR000009', 0),
('W20010', 'PR000010', 0),
('W20011', 'PR000011', 0),
('W20012', 'PR000012', 0),
('W20013', 'PR000013', 0),
('W20014', 'PR000014', 0),
('W20015', 'PR000015', 0),
('W20016', 'PR000016', 0),
('W20017', 'PR000017', 0),
('W20018', 'PR000018', 0),
('W20019', 'PR000019', 0),
('W20020', 'PR000020', 0);


-- Inserting sample data into the product table
INSERT INTO product (product_id, `name`, brand, color, category, gender, product_price, picture)
VALUES 
('PR000001', 'Air Jordan True Blue', 'Nike', 'Blue', 'Sports', 'Male', 2000000, 'picture1'),
('PR000002', 'Air Jordan Bred', 'Nike', 'Black', 'Sports', 'Male', 1900000, 'picture2'),
('PR000003', 'Air Jordan Space Jam', 'Nike', 'Black', 'Sports', 'Male', 2100000, 'picture3'),
('PR000004', 'Air Force 1 Low', 'Nike', 'White', 'Casual', 'Male', 900000, 'picture4'),
('PR000005', 'Air Force 1 High', 'Nike', 'Black', 'Casual', 'Male', 1000000, 'picture5'),
('PR000006', 'Blazer Mid 77', 'Nike', 'Red', 'Casual', 'Female', 1100000, 'picture6'),
('PR000007', 'Cortez Basic Leather', 'Nike', 'White', 'Casual', 'Female', 800000, 'picture7'),
('PR000008', 'Air Max 90', 'Nike', 'Black', 'Sports', 'Male', 1300000, 'picture8'),
('PR000009', 'Air Max 97', 'Nike', 'Silver', 'Sports', 'Male', 1700000, 'picture9'),
('PR000010', 'React Element 55', 'Nike', 'Volt', 'Casual', 'Female', 1200000, 'picture10'),
('PR000011', 'Superstar', 'Adidas', 'White', 'Casual', 'Female', 800000, 'picture11'),
('PR000012', 'Stan Smith', 'Adidas', 'White', 'Casual', 'Female', 900000, 'picture12'),
('PR000013', 'Ultra Boost', 'Adidas', 'Black', 'Sports', 'Male', 1800000, 'picture13'),
('PR000014', 'NMD_R1', 'Adidas', 'Black', 'Casual', 'Female', 1300000, 'picture14'),
('PR000015', 'Yeezy Boost 350 V2', 'Adidas', 'Sesame', 'Casual', 'Male', 2300000, 'picture15'),
('PR000016', 'Alphabounce Beyond', 'Adidas', 'Grey', 'Sports', 'Male', 1000000, 'picture16'),
('PR000017', 'Gazelle', 'Adidas', 'Blue', 'Casual', 'Female', 1000000, 'picture17'),
('PR000018', 'Continental 80', 'Adidas', 'Off White', 'Casual', 'Female', 900000, 'picture18'),
('PR000019', 'Samba Classic', 'Adidas', 'Black', 'Casual', 'Male', 700000, 'picture19'),
('PR000020', 'Originals Nite Jogger', 'Adidas', 'Solar Orange', 'Casual', 'Male', 1600000, 'picture20');

-- Inserting sample data into the product_inventory table
INSERT INTO product_inventory (productinventory_Id, product_id, size, stock)
VALUES 
('PI000001', 'PR000001', '40', 10),
('PI000002', 'PR000001', '41', 0),
('PI000003', 'PR000001', '42', 20),
('PI000004', 'PR000001', '43', 25),
('PI000005', 'PR000001', '45', 12),
('PI000006', 'PR000002', '40', 5),
('PI000007', 'PR000002', '41', 18),
('PI000008', 'PR000002', '42', 0),
('PI000009', 'PR000002', '43', 25),
('PI000010', 'PR000002', '45', 10),
('PI000011', 'PR000003', '40', 15),
('PI000012', 'PR000003', '41', 0),
('PI000013', 'PR000003', '42', 18),
('PI000014', 'PR000003', '43', 0),
('PI000015', 'PR000003', '45', 8),
('PI000016', 'PR000004', '40', 8),
('PI000017', 'PR000004', '41', 10),
('PI000018', 'PR000004', '42', 0),
('PI000019', 'PR000004', '43', 20),
('PI000020', 'PR000004', '45', 5),
('PI000021', 'PR000005', '40', 10),
('PI000022', 'PR000005', '41', 15),
('PI000023', 'PR000005', '42', 0),
('PI000024', 'PR000005', '43', 25),
('PI000025', 'PR000005', '45', 12),
('PI000026', 'PR000006', '40', 20),
('PI000027', 'PR000006', '41', 18),
('PI000028', 'PR000006', '42', 22),
('PI000029', 'PR000006', '43', 0),
('PI000030', 'PR000006', '45', 10),
('PI000031', 'PR000007', '40', 0),
('PI000032', 'PR000007', '41', 12),
('PI000033', 'PR000007', '42', 18),
('PI000034', 'PR000007', '43', 20),
('PI000035', 'PR000007', '45', 8),
('PI000036', 'PR000008', '40', 8),
('PI000037', 'PR000008', '41', 0),
('PI000038', 'PR000008', '42', 15),
('PI000039', 'PR000008', '43', 20),
('PI000040', 'PR000008', '45', 5),
('PI000041', 'PR000009', '40', 10),
('PI000042', 'PR000009', '41', 0),
('PI000043', 'PR000009', '42', 20),
('PI000044', 'PR000009', '43', 25),
('PI000045', 'PR000009', '45', 12),
('PI000046', 'PR000010', '40', 20),
('PI000047', 'PR000010', '41', 0),
('PI000048', 'PR000010', '42', 22),
('PI000049', 'PR000010', '43', 25),
('PI000050', 'PR000010', '45', 0),
('PI000051', 'PR000011', '40', 15),
('PI000052', 'PR000011', '41', 12),
('PI000053', 'PR000011', '42', 0),
('PI000054', 'PR000011', '43', 20),
('PI000055', 'PR000011', '45', 8),
('PI000056', 'PR000012', '40', 8),
('PI000057', 'PR000012', '41', 0),
('PI000058', 'PR000012', '42', 15),
('PI000059', 'PR000012', '43', 20),
('PI000060', 'PR000012', '45', 5),
('PI000061', 'PR000013', '40', 0),
('PI000062', 'PR000013', '41', 15),
('PI000063', 'PR000013', '42', 20),
('PI000064', 'PR000013', '43', 25),
('PI000065', 'PR000013', '45', 12),
('PI000066', 'PR000014', '40', 20),
('PI000067', 'PR000014', '41', 18),
('PI000068', 'PR000014', '42', 22),
('PI000069', 'PR000014', '43', 0),
('PI000070', 'PR000014', '45', 10),
('PI000071', 'PR000015', '40', 15),
('PI000072', 'PR000015', '41', 12),
('PI000073', 'PR000015', '42', 0),
('PI000074', 'PR000015', '43', 20),
('PI000075', 'PR000015', '45', 8),
('PI000076', 'PR000016', '40', 8),
('PI000077', 'PR000016', '41', 0),
('PI000078', 'PR000016', '42', 15),
('PI000079', 'PR000016', '43', 20),
('PI000080', 'PR000016', '45', 5),
('PI000081', 'PR000017', '40', 0),
('PI000082', 'PR000017', '41', 15),
('PI000083', 'PR000017', '42', 20),
('PI000084', 'PR000017', '43', 25),
('PI000085', 'PR000017', '45', 12),
('PI000086', 'PR000018', '40', 20),
('PI000087', 'PR000018', '41', 18),
('PI000088', 'PR000018', '42', 0),
('PI000089', 'PR000018', '43', 25),
('PI000090', 'PR000018', '45', 10),
('PI000091', 'PR000019', '40', 0),
('PI000092', 'PR000019', '41', 12),
('PI000093', 'PR000019', '42', 18),
('PI000094', 'PR000019', '43', 0),
('PI000095', 'PR000019', '45', 8),
('PI000096', 'PR000020', '40', 8),
('PI000097', 'PR000020', '41', 0),
('PI000098', 'PR000020', '42', 15),
('PI000099', 'PR000020', '43', 20),
('PI000100', 'PR000020', '45', 5);

INSERT INTO customer (customer_id, name, email, phone, password, is_warehouse)
VALUES
('CU200001', 'ChrisEvans', 'chrisevans@gmail.com', '081234567890', 'CE123456', 0),
('CU200002', 'AnnaSmith', 'annasmith@yahoo.com', '082345678901', 'AS234567', 0),
('CU200003', 'DavidClark', 'davidclark@hotmail.com', '083456789012', 'DC345678', 0),
('CU200004', 'SophiaBrown', 'sophiabrown@outlook.com', '084567890123', 'SB456789', 0),
('CU200005', 'JamesDavis', 'jamesdavis@gmail.com', '085678901234', 'JD567890', 0),
('CU200006', 'EmmaWilson', 'emmawilson@yahoo.com', '086789012345', 'EW678901', 0),
('CU200007', 'LiamJohnson', 'liamjohnson@hotmail.com', '087890123456', 'LJ789012', 0),
('CU200008', 'OliviaLee', 'oliviale@outlook.com', '088901234567', 'OL890123', 0),
('CU200009', 'LucasMartinez', 'lucasmartinez@gmail.com', '089012345678', 'LM901234', 0),
('CU200010', 'MiaTurner', 'miaturner@yahoo.com', '089102345678', 'MT012345', 0),
('CU200011', 'MasonWalker', 'masonwalker@hotmail.com', '082345678910', 'MW123456', 0),
('CU200012', 'AvaHarris', 'avaharris@gmail.com', '083456789123', 'AH234567', 0),
('CU200013', 'NoahThomas', 'noahthomas@yahoo.com', '084567890234', 'NT345678', 0),
('CU200014', 'SophiaMoore', 'sophiamoore@hotmail.com', '085678901345', 'SM456789', 0),
('CU200015', 'JacobRobinson', 'jacobrobinson@outlook.com', '086789012456', 'JR567890', 0),
('CU200016', 'IsabellaHall', 'isabellahall@gmail.com', '087890123567', 'IH678901', 0),
('CU200017', 'WilliamYoung', 'williamyoung@yahoo.com', '088901234678', 'WY789012', 0),
('CU200018', 'EmilyKing', 'emilyking@hotmail.com', '089012345789', 'EK890123', 0),
('CU200019', 'MichaelWright', 'michaelwright@outlook.com', '081234567898', 'MW901234', 0),
('CU200020', 'HarperGreen', 'harpergreen@gmail.com', '082345678909', 'HG012345', 0);

-- Inserting sample data into the order table with updated order_id and customer_id
INSERT INTO `order` (order_id, customer_id, order_date, total_price, is_warehouse)
VALUES
('C2023070101', 'CU200001', '2023-07-01 ', 4200000, 0),
('C2023070202', 'CU200009', '2023-07-02 ', 2100000, 0),
('C2023070303', 'CU200009', '2023-07-03 ', 6300000, 0),
('C2023070404', 'CU200001', '2023-07-04 ', 2100000, 0),
('C2023070505', 'CU200005', '2023-07-05 ', 2100000, 0),
('C2023070606', 'CU200006', '2023-07-06 ', 4200000, 0),
('C2023070707', 'CU200007', '2023-07-07 ', 2100000, 0),
('C2023070808', 'CU200004', '2023-07-08 ', 4200000, 0),
('C2023070909', 'CU200002', '2023-07-09 ', 2100000, 0),
('C2023071010', 'CU200011', '2023-07-10 ', 2100000, 0),
('C2023071111', 'CU200011', '2023-07-11 ', 2100000, 0),
('C2023071212', 'CU200011', '2023-07-12 ', 4200000, 0),
('C2023071313', 'CU200011', '2023-07-13 ', 2100000, 0),
('C2023071414', 'CU200014', '2023-07-14 ', 2100000, 0),
('C2023071515', 'CU200015', '2023-07-15 ', 4200000, 0),
('C2023071616', 'CU200016', '2023-07-16 ', 2100000, 0),
('C2023071717', 'CU200017', '2023-07-17 ', 900000, 0),
('C2023071818', 'CU200018', '2023-07-18 ', 900000, 0),
('C2023071919', 'CU200019', '2023-07-19 ', 900000, 0),
('C2023072020', 'CU200013', '2023-07-20 ', 900000, 0),
('C2023082121', 'CU200012', '2023-08-21 ', 900000, 0),
('C2023092222', 'CU200020', '2023-09-22 ', 900000, 0),
('C2023102323', 'CU200020', '2023-10-23 ', 900000, 0),
('C2023112424', 'CU200020', '2023-11-24 ', 900000, 0),
('C2023122525', 'CU200020', '2023-12-25 ', 900000, 0);



-- Insert sample data into the order_detail table with updated order_id
INSERT INTO order_detail (orderdetail_id, order_id, product_id, size, quantity, product_price, is_warehouse)
VALUES
('OR20001', 'C2023070101', 'PR000003', '43', 2, 2100000, 0),
('OR20002', 'C2023070202', 'PR000003', '41', 1, 2100000, 0),
('OR20003', 'C2023070303', 'PR000001', '43', 3, 2100000, 0),
('OR20004', 'C2023070404', 'PR000006', '40', 1, 2100000, 0),
('OR20005', 'C2023070505', 'PR000007', '40', 1, 2100000, 0),
('OR20006', 'C2023070606', 'PR000008', '40', 2, 2100000, 0),
('OR20007', 'C2023070707', 'PR000010', '40', 1, 2100000, 0),
('OR20008', 'C2023070808', 'PR000002', '40', 2, 2100000, 0),
('OR20009', 'C2023070909', 'PR000008', '40', 1, 2100000, 0),
('OR20010', 'C2023071010', 'PR000003', '40', 1, 2100000, 0),
('OR20011', 'C2023071111', 'PR000003', '40', 1, 2100000, 0),
('OR20012', 'C2023071212', 'PR000009', '45', 2, 2100000, 0),
('OR20013', 'C2023071313', 'PR000009', '40', 1, 2100000, 0),
('OR20014', 'C2023071414', 'PR000011', '40', 1, 2100000, 0),
('OR20015', 'C2023071515', 'PR000012', '40', 2, 2100000, 0),
('OR20016', 'C2023071616', 'PR000013', '40', 1, 2100000, 0),
('OR20017', 'C2023071717', 'PR000002', '41', 1, 900000, 0),
('OR20018', 'C2023071818', 'PR000001', '42', 1, 900000, 0),
('OR20019', 'C2023071919', 'PR000004', '40', 1, 900000, 0),
('OR20020', 'C2023072020', 'PR000004', '40', 1, 900000, 0),
('OR20021', 'C2023082121', 'PR000001', '40', 1, 900000, 0),
('OR20022', 'C2023092222', 'PR000008', '40', 1, 900000, 0),
('OR20023', 'C2023102323', 'PR000007', '40', 1, 900000, 0),
('OR20024', 'C2023112424', 'PR000004', '40', 1, 900000, 0),
('OR20025', 'C2023122525', 'PR000009', '40', 1, 900000, 0);



drop database if exists branch4;
create database branch4;
use branch4;

CREATE TABLE IF NOT EXISTS customer (
    customer_id VARCHAR(8) PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    `password` VARCHAR(30),
	is_warehouse BOOL DEFAULT 0
    
);

CREATE TABLE IF NOT EXISTS product (
    product_id varchar(8) PRIMARY KEY,
    `name` VARCHAR(100),
    brand VARCHAR(100),
    color VARCHAR(50),
    category VARCHAR(100),
    gender VARCHAR(10),
    product_price INT,
    picture VARCHAR(100)
    -- Add other relevant columns here
);

CREATE TABLE IF NOT EXISTS product_inventory (
    productinventory_Id VARCHAR(8) PRIMARY KEY,
    product_id varchar(8),
    size VARCHAR(10),
    stock INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

drop table if exists `order`;
CREATE TABLE IF NOT EXISTS `order` (
  order_id VARCHAR(11) PRIMARY KEY,
  customer_id VARCHAR(8) NOT NULL,
  order_date DATE NOT NULL,
  total_price INT NOT NULL,
  is_warehouse BOOL DEFAULT 0,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

drop table if exists order_detail;
CREATE TABLE IF NOT EXISTS order_detail (
  orderdetail_id VARCHAR(11) PRIMARY KEY,
  order_id VARCHAR(11) NOT NULL,
  product_id VARCHAR(8) NOT NULL,
  size varchar(10),
  quantity INT NOT NULL,
  product_price INT NOT NULL,  
  is_warehouse BOOL DEFAULT 0,
  FOREIGN KEY (order_id) REFERENCES `order`(order_id),
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE cart (
    id_cart VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(8) references customer(customer_id),
    product_id varchar(8) references product(product_id),
    product_price INT,
    is_warehouse BOOL DEFAULT 0
);

CREATE TABLE wishlist (
    id_wishlist VARCHAR(10) PRIMARY KEY,
    product_id varchar(8) references product(product_id),
    is_warehouse BOOL DEFAULT 0
);

INSERT INTO cart (id_cart, customer_id, product_id, product_price, is_warehouse) VALUES
('C30001', 'CU000001', 'PR000001', 2000000, 0),
('C30002', 'CU000005', 'PR000005', 1000000, 0),
('C30003', 'CU000006', 'PR000006', 1100000, 0),
('C30004', 'CU000007', 'PR000007', 800000, 0),
('C30005', 'CU000010', 'PR000010', 1200000, 0),
('C30006', 'CU000011', 'PR000011', 800000, 0),
('C30007', 'CU000012', 'PR000012', 900000, 0),
('C30008', 'CU000015', 'PR000015', 2300000, 0),
('C30009', 'CU000016', 'PR000016', 1000000, 0),
('C30010', 'CU000017', 'PR000017', 1000000, 0),
('C30011', 'CU000018', 'PR000018', 900000, 0),
('C30012', 'CU000020', 'PR000020', 1600000, 0);

INSERT INTO wishlist (id_wishlist, product_id, is_warehouse) VALUES
('W30001', 'PR000003', 0),
('W30002', 'PR000004', 0),
('W30003', 'PR000005', 0),
('W30004', 'PR000007', 0),
('W30005', 'PR000009', 0),
('W30006', 'PR000010', 0),
('W30007', 'PR000011', 0),
('W30008', 'PR000013', 0),
('W30009', 'PR000014', 0),
('W30010', 'PR000016', 0),
('W30011', 'PR000017', 0),
('W30012', 'PR000018', 0);

-- Inserting sample data into the product table
INSERT INTO product (product_id, `name`, brand, color, category, gender, product_price, picture)
VALUES 
('PR000001', 'Air Jordan True Blue', 'Nike', 'Blue', 'Sports', 'Male', 2000000, 'picture1'),
('PR000002', 'Air Jordan Bred', 'Nike', 'Black', 'Sports', 'Male', 1900000, 'picture2'),
('PR000003', 'Air Jordan Space Jam', 'Nike', 'Black', 'Sports', 'Male', 2100000, 'picture3'),
('PR000004', 'Air Force 1 Low', 'Nike', 'White', 'Casual', 'Male', 900000, 'picture4'),
('PR000005', 'Air Force 1 High', 'Nike', 'Black', 'Casual', 'Male', 1000000, 'picture5'),
('PR000006', 'Blazer Mid 77', 'Nike', 'Red', 'Casual', 'Female', 1100000, 'picture6'),
('PR000007', 'Cortez Basic Leather', 'Nike', 'White', 'Casual', 'Female', 800000, 'picture7'),
('PR000008', 'Air Max 90', 'Nike', 'Black', 'Sports', 'Male', 1300000, 'picture8'),
('PR000009', 'Air Max 97', 'Nike', 'Silver', 'Sports', 'Male', 1700000, 'picture9'),
('PR000010', 'React Element 55', 'Nike', 'Volt', 'Casual', 'Female', 1200000, 'picture10'),
('PR000011', 'Superstar', 'Adidas', 'White', 'Casual', 'Female', 800000, 'picture11'),
('PR000012', 'Stan Smith', 'Adidas', 'White', 'Casual', 'Female', 900000, 'picture12'),
('PR000013', 'Ultra Boost', 'Adidas', 'Black', 'Sports', 'Male', 1800000, 'picture13'),
('PR000014', 'NMD_R1', 'Adidas', 'Black', 'Casual', 'Female', 1300000, 'picture14'),
('PR000015', 'Yeezy Boost 350 V2', 'Adidas', 'Sesame', 'Casual', 'Male', 2300000, 'picture15'),
('PR000016', 'Alphabounce Beyond', 'Adidas', 'Grey', 'Sports', 'Male', 1000000, 'picture16'),
('PR000017', 'Gazelle', 'Adidas', 'Blue', 'Casual', 'Female', 1000000, 'picture17'),
('PR000018', 'Continental 80', 'Adidas', 'Off White', 'Casual', 'Female', 900000, 'picture18'),
('PR000019', 'Samba Classic', 'Adidas', 'Black', 'Casual', 'Male', 700000, 'picture19'),
('PR000020', 'Originals Nite Jogger', 'Adidas', 'Solar Orange', 'Casual', 'Male', 1600000, 'picture20');

-- Inserting sample data into the product_inventory table
INSERT INTO product_inventory (productinventory_Id, product_id, size, stock)
VALUES 
('PI000001', 'PR000001', '40', 10),
('PI000002', 'PR000001', '41', 0),
('PI000003', 'PR000001', '42', 20),
('PI000004', 'PR000001', '43', 25),
('PI000005', 'PR000001', '45', 12),
('PI000006', 'PR000002', '40', 5),
('PI000007', 'PR000002', '41', 18),
('PI000008', 'PR000002', '42', 0),
('PI000009', 'PR000002', '43', 25),
('PI000010', 'PR000002', '45', 10),
('PI000011', 'PR000003', '40', 15),
('PI000012', 'PR000003', '41', 0),
('PI000013', 'PR000003', '42', 18),
('PI000014', 'PR000003', '43', 0),
('PI000015', 'PR000003', '45', 8),
('PI000016', 'PR000004', '40', 8),
('PI000017', 'PR000004', '41', 10),
('PI000018', 'PR000004', '42', 0),
('PI000019', 'PR000004', '43', 20),
('PI000020', 'PR000004', '45', 5),
('PI000021', 'PR000005', '40', 10),
('PI000022', 'PR000005', '41', 15),
('PI000023', 'PR000005', '42', 0),
('PI000024', 'PR000005', '43', 25),
('PI000025', 'PR000005', '45', 12),
('PI000026', 'PR000006', '40', 20),
('PI000027', 'PR000006', '41', 18),
('PI000028', 'PR000006', '42', 22),
('PI000029', 'PR000006', '43', 0),
('PI000030', 'PR000006', '45', 10),
('PI000031', 'PR000007', '40', 0),
('PI000032', 'PR000007', '41', 12),
('PI000033', 'PR000007', '42', 18),
('PI000034', 'PR000007', '43', 20),
('PI000035', 'PR000007', '45', 8),
('PI000036', 'PR000008', '40', 8),
('PI000037', 'PR000008', '41', 0),
('PI000038', 'PR000008', '42', 15),
('PI000039', 'PR000008', '43', 20),
('PI000040', 'PR000008', '45', 5),
('PI000041', 'PR000009', '40', 10),
('PI000042', 'PR000009', '41', 0),
('PI000043', 'PR000009', '42', 20),
('PI000044', 'PR000009', '43', 25),
('PI000045', 'PR000009', '45', 12),
('PI000046', 'PR000010', '40', 20),
('PI000047', 'PR000010', '41', 0),
('PI000048', 'PR000010', '42', 22),
('PI000049', 'PR000010', '43', 25),
('PI000050', 'PR000010', '45', 0),
('PI000051', 'PR000011', '40', 15),
('PI000052', 'PR000011', '41', 12),
('PI000053', 'PR000011', '42', 0),
('PI000054', 'PR000011', '43', 20),
('PI000055', 'PR000011', '45', 8),
('PI000056', 'PR000012', '40', 8),
('PI000057', 'PR000012', '41', 0),
('PI000058', 'PR000012', '42', 15),
('PI000059', 'PR000012', '43', 20),
('PI000060', 'PR000012', '45', 5),
('PI000061', 'PR000013', '40', 0),
('PI000062', 'PR000013', '41', 15),
('PI000063', 'PR000013', '42', 20),
('PI000064', 'PR000013', '43', 25),
('PI000065', 'PR000013', '45', 12),
('PI000066', 'PR000014', '40', 20),
('PI000067', 'PR000014', '41', 18),
('PI000068', 'PR000014', '42', 22),
('PI000069', 'PR000014', '43', 0),
('PI000070', 'PR000014', '45', 10),
('PI000071', 'PR000015', '40', 15),
('PI000072', 'PR000015', '41', 12),
('PI000073', 'PR000015', '42', 0),
('PI000074', 'PR000015', '43', 20),
('PI000075', 'PR000015', '45', 8),
('PI000076', 'PR000016', '40', 8),
('PI000077', 'PR000016', '41', 0),
('PI000078', 'PR000016', '42', 15),
('PI000079', 'PR000016', '43', 20),
('PI000080', 'PR000016', '45', 5),
('PI000081', 'PR000017', '40', 0),
('PI000082', 'PR000017', '41', 15),
('PI000083', 'PR000017', '42', 20),
('PI000084', 'PR000017', '43', 25),
('PI000085', 'PR000017', '45', 12),
('PI000086', 'PR000018', '40', 20),
('PI000087', 'PR000018', '41', 18),
('PI000088', 'PR000018', '42', 0),
('PI000089', 'PR000018', '43', 25),
('PI000090', 'PR000018', '45', 10),
('PI000091', 'PR000019', '40', 0),
('PI000092', 'PR000019', '41', 12),
('PI000093', 'PR000019', '42', 18),
('PI000094', 'PR000019', '43', 0),
('PI000095', 'PR000019', '45', 8),
('PI000096', 'PR000020', '40', 8),
('PI000097', 'PR000020', '41', 0),
('PI000098', 'PR000020', '42', 15),
('PI000099', 'PR000020', '43', 20),
('PI000100', 'PR000020', '45', 5);

INSERT INTO customer (customer_id, name, email, phone, password, is_warehouse)
VALUES
('CU300001', 'AgusSuwandi', 'agussuwandi@gmail.com', '081234567890', 'AS2024', 0),
('CU300002', 'BudiHartono', 'budihartono@yahoo.com', '081345678901', 'BH2024', 0),
('CU300003', 'CitraLestari', 'citralestari@hotmail.com', '081456789012', 'CL2024', 0),
('CU300004', 'DewiSusanti', 'dewisusanti@outlook.com', '081567890123', 'DS2024', 0),
('CU300005', 'EkoPrasetyo', 'ekoprasetyo@gmail.com', '081678901234', 'EP2024', 0),
('CU300006', 'FajarHidayat', 'fajarhidayat@yahoo.com', '081789012345', 'FH2024', 0),
('CU300007', 'GitaWulandari', 'gitawulandari@hotmail.com', '081890123456', 'GW2024', 0),
('CU300008', 'HadiSetiawan', 'hadisetiawan@outlook.com', '081901234567', 'HS2024', 0),
('CU300009', 'IndahPurnama', 'indahpurnama@gmail.com', '082012345678', 'IP2024', 0),
('CU300010', 'JokoSantoso', 'jokosantoso@yahoo.com', '082123456789', 'JS2024', 0),
('CU300011', 'KartikaSari', 'kartikasari@hotmail.com', '082234567890', 'KS2024', 0),
('CU300012', 'LinaWati', 'linawati@gmail.com', '082345678901', 'LW2024', 0),
('CU300013', 'MayaKurnia', 'mayakurnia@yahoo.com', '082456789012', 'MK2024', 0),
('CU300014', 'NugrohoPramono', 'nugrohopramono@hotmail.com', '082567890123', 'NP2024', 0),
('CU300015', 'OkaPutra', 'okaputra@outlook.com', '082678901234', 'OP2024', 0),
('CU300016', 'PutuWidi', 'putuwidi@gmail.com', '082789012345', 'PW2024', 0),
('CU300017', 'RiniAyu', 'riniayu@yahoo.com', '082890123456', 'RA2024', 0),
('CU300018', 'SintaDewi', 'sintadewi@hotmail.com', '082901234567', 'SD2024', 0),
('CU300019', 'ToniWijaya', 'toniwijaya@outlook.com', '083012345678', 'TW2024', 0),
('CU300020', 'UliAndriani', 'uliandriani@gmail.com', '083123456789', 'UA2024', 0);

-- Inserting sample data into the order table with updated order_id and customer_id
INSERT INTO `order` (order_id, customer_id, order_date, total_price, is_warehouse)
VALUES
('D2024010101', 'CU300001', '2024-01-01 ', 3600000, 0),
('D2024010102', 'CU300001', '2024-01-01 ', 2000000, 0),
('D2024010103', 'CU300001', '2024-01-01', 6000000, 0),
('D2024010201', 'CU300004', '2024-01-02 ', 2000000, 0),
('D2024010301', 'CU300002', '2024-01-03 ', 2000000, 0),
('D2024010401', 'CU300003', '2024-01-04 ', 4000000, 0),
('D2024010501', 'CU300008', '2024-01-05 ', 9000000, 0),
('D2024010601', 'CU300008', '2024-01-06 ', 3800000, 0),
('D2024010701', 'CU300009', '2024-01-07 ', 1900000, 0),
('D2024010801', 'CU300010', '2024-01-08 ', 1900000, 0),
('D2024010901', 'CU300011', '2024-01-09 ', 1900000, 0),
('D2024011001', 'CU300012', '2024-01-10 ', 3800000, 0),
('D2024011101', 'CU300013', '2024-01-11 ', 1900000, 0),
('D2024011201', 'CU300014', '2024-01-12 ', 1900000, 0),
('D2024011301', 'CU300015', '2024-01-13 ', 4200000, 0),
('D2024011401', 'CU300016', '2024-01-14 ', 2100000, 0),
('D2024011501', 'CU300017', '2024-01-15 ', 2100000, 0),
('D2024011601', 'CU300018', '2024-01-16 ', 2100000, 0),
('D2024011701', 'CU300019', '2024-01-17 ', 2100000, 0),
('D2024011801', 'CU300019', '2024-01-18 ', 2100000, 0),
('D2024011901', 'CU300020', '2024-01-19 ', 2100000, 0),
('D2024012001', 'CU300020', '2024-01-20 ', 2100000, 0),
('D2024012101', 'CU300020', '2024-01-21 ', 2100000, 0),
('D2024012201', 'CU300020', '2024-01-22 ', 9000000, 0),
('D2024012301', 'CU300020', '2024-01-23 ', 9000000, 0);

-- Insert sample data into the order_detail table with updated order_id
INSERT INTO order_detail (orderdetail_id, order_id, product_id, size, quantity, product_price, is_warehouse)
VALUES
('OR30001', 'D2024010101', 'PR000004', '40', 2, 1800000, 0),
('OR30002', 'D2024010102', 'PR000001', '41', 1, 2000000, 0),
('OR30003', 'D2024010103', 'PR000001', '40', 3, 2000000, 0),
('OR30004', 'D2024010201', 'PR000001', '40', 1, 2000000, 0),
('OR30005', 'D2024010301', 'PR000001', '40', 1, 2000000, 0),
('OR30006', 'D2024010401', 'PR000001', '40', 2, 2000000, 0),
('OR30007', 'D2024010501', 'PR000004', '40', 1, 9000000, 0),
('OR30008', 'D2024010601', 'PR000002', '40', 2, 1900000, 0),
('OR30009', 'D2024010701', 'PR000002', '40', 1, 1900000, 0),
('OR30010', 'D2024010801', 'PR000002', '40', 1, 1900000, 0),
('OR30011', 'D2024010901', 'PR000002', '40', 1, 1900000, 0),
('OR30012', 'D2024011001', 'PR000002', '45', 2, 1900000, 0),
('OR30013', 'D2024011101', 'PR000002', '40', 1, 1900000, 0),
('OR30014', 'D2024011201', 'PR000003', '40', 1, 2100000, 0),
('OR30015', 'D2024011301', 'PR000003', '40', 2, 2100000, 0),
('OR30016', 'D2024011401', 'PR000003', '40', 1, 2100000, 0),
('OR30017', 'D2024011501', 'PR000003', '40', 1, 2100000, 0),
('OR30018', 'D2024011601', 'PR000003', '42', 1, 2100000, 0),
('OR30019', 'D2024011701', 'PR000003', '40', 1, 2100000, 0),
('OR30020', 'D2024011801', 'PR000003', '40', 1, 2100000, 0),
('OR30021', 'D2024011901', 'PR000003', '40', 1, 2100000, 0),
('OR30022', 'D2024012001', 'PR000003', '40', 1, 2100000, 0),
('OR30023', 'D2024012101', 'PR000003', '40', 1, 2100000, 0),
('OR30024', 'D2024012201', 'PR000004', '40', 1, 9000000, 0),
('OR30025', 'D2024012301', 'PR000004', '40', 1, 9000000, 0);