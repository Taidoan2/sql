
 CREATE table users (
	users_id VARCHAR(36) default (uuid()) PRIMARY KEY,
	full_name VARCHAR(255),
	email VARCHAR(255),
	pass_word VARCHAR(255)
)


CREATE table foods (
	food_id INT PRIMARY KEY AUTO_INCREMENT,
	food_name VARCHAR(255),
	imgae VARCHAR(255),
	price FLOAT,
	descs VARCHAR(255),
	type_id INT,
	FOREIGN KEY (type_id) references foods_type(type_id)
)

CREATE table sub_food (
	sub_id INT PRIMARY KEY AUTO_INCREMENT,
	sub_name VARCHAR(255),
	sub_price FLOAT,
	food_id INT,
	FOREIGN KEY (food_id) references foods(food_id)
)

CREATE TABLE orders (
	order_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id VARCHAR(36) default (uuid()),
	food_id INT,
	amount INT,
	code VARCHAR(255),
	arr_sub_id VARCHAR(255),
	FOREIGN KEY (user_id) references users(users_id),
	FOREIGN KEY (food_id) references foods (food_id)
)

INSERT INTO orders (user_id, food_id, amount, code, arr_sub_id) VALUES



CREATE TABLE foods_type (
	type_id INT PRIMARY KEY AUTO_INCREMENT,
	type_name VARCHAR(255)
)

--------------------------------------------------

CREATE table rate_res (
	user_id VARCHAR(36) default (uuid()),
	res_id INT,
	amount INT,
	date_rate TIMESTAMP,
	FOREIGN KEY (user_id) references users(users_id),
	FOREIGN KEY (res_id) references restaurant (res_id) 	
)

CREATE table restaurant (
	res_id INT PRIMARY KEY AUTO_INCREMENT,
	res_name VARCHAR(255),
	imgae VARCHAR(255),
	descs VARCHAR(255)
)


CREATE table like_res (
	users_id VARCHAR(36) default (uuid()),
	res_id INT,
	date_like TIMESTAMP,
	FOREIGN KEY (users_id) references users(users_id),
	FOREIGN KEY (res_id) references restaurant(res_id)
)




SELECT * 
from users u 




-- left join orders o on u.users_id = o.user_id
-- left join foods f on o.food_id = f.food_id 
-- left join foods_type ft on f.type_id = ft.type_id 


INSERT INTO users (users_id, full_name, email, pass_word) VALUES
(UUID(), 'Nguyen Van A', 'nguyenvana1@example.com', 'passwordA1'),
(UUID(), 'Tran Thi B', 'tranthib2@example.com', 'passwordB2'),
(UUID(), 'Le Van C', 'levanc3@example.com', 'passwordC3'),
(UUID(), 'Hoang Thi D', 'hoangthid4@example.com', 'passwordD4'),
(UUID(), 'Pham Van E', 'phamvane5@example.com', 'passwordE5'),
(UUID(), 'Vu Thi F', 'vuthif6@example.com', 'passwordF6'),
(UUID(), 'Bui Van G', 'buivang7@example.com', 'passwordG7'),
(UUID(), 'Nguyen Thi H', 'nguyenthih8@example.com', 'passwordH8'),
(UUID(), 'Tran Van I', 'tranvani9@example.com', 'passwordI9'),
(UUID(), 'Le Thi J', 'lethij10@example.com', 'passwordJ10')


SELECT * FROM foods f 


INSERT INTO foods (food_id, food_name, imgae , price, descs, type_id) VALUES
(1, 'Pho', 'pho.jpg', 5.99, 'Traditional Vietnamese noodle soup.', 1),
(2, 'Banh Mi', 'banhmi.jpg', 3.50, 'Vietnamese sandwich.', 1),
(3, 'Spring Rolls', 'springrolls.jpg', 2.99, 'Fresh spring rolls.', 1),
(4, 'Bun Bo Hue', 'bunbohue.jpg', 6.50, 'Spicy beef noodle soup.', 2),
(5, 'Com Tam', 'comtam.jpg', 4.99, 'Broken rice with pork.', 2),
(6, 'Goi Cuon', 'goicuon.jpg', 3.00, 'Vietnamese summer rolls.', 3),
(7, 'Cha Gio', 'chagio.jpg', 2.50, 'Fried spring rolls.', 3),
(8, 'Ca Kho', 'cakho.jpg', 7.99, 'Braised fish.', 4),
(9, 'Canh Chua', 'canhchua.jpg', 5.50, 'Sweet and sour soup.', 4),
(10, 'Tom Rim', 'tomrim.jpg', 6.99, 'Caramelized shrimp.', 5)



INSERT INTO foods_type (type_id, type_name) VALUES
(1, 'Soup'),
(2, 'Main Course'),
(3, 'Appetizer'),
(4, 'Seafood'),
(5, 'Grilled'),
(6, 'Specialty'),
(7, 'Noodles'),
(8, 'Pancakes'),
(9, 'Desserts'),
(10, 'Sticky Rice');


SELECT * from orders o 




INSERT INTO orders (order_id, user_id, food_id, amount, code, arr_sub_id) VALUES
(1, (SELECT users_id FROM users ORDER BY RAND() LIMIT 1), 1, 2, 'ORD001', 'SUB1,SUB2'),
(2, (SELECT users_id FROM users ORDER BY RAND() LIMIT 1), 2, 3, 'ORD002', 'SUB3,SUB4'),
(3, (SELECT users_id FROM users ORDER BY RAND() LIMIT 1), 3, 1, 'ORD003', 'SUB2,SUB5'),
(4, (SELECT users_id FROM users ORDER BY RAND() LIMIT 1), 4, 1, 'ORD004', 'SUB3,SUB6'),
(5, (SELECT users_id FROM users ORDER BY RAND() LIMIT 1), 5, 2, 'ORD005', 'SUB1,SUB4'),
(6, (SELECT users_id FROM users ORDER BY RAND() LIMIT 1), 6, 1, 'ORD006', 'SUB3,SUB2'),
(7, (SELECT users_id FROM users ORDER BY RAND() LIMIT 1), 7, 3, 'ORD007', 'SUB4,SUB5'),
(8, (SELECT users_id FROM users ORDER BY RAND() LIMIT 1), 8, 2, 'ORD008', 'SUB6,SUB1'),
(9, (SELECT users_id FROM users ORDER BY RAND() LIMIT 1), 9, 1, 'ORD009', 'SUB4,SUB3'),
(10, (SELECT users_id FROM users ORDER BY RAND() LIMIT 1), 10, 2, 'ORD010', 'SUB5,SUB6');



SELECT * from sub_food sf 



INSERT INTO sub_food (sub_name, sub_price, food_id) VALUES
('Burger', 5.99, (SELECT food_id FROM foods ORDER BY RAND() LIMIT 1)),
('Pizza', 8.49, (SELECT food_id FROM foods ORDER BY RAND() LIMIT 1)),
('Pasta', 7.25, (SELECT food_id FROM foods ORDER BY RAND() LIMIT 1)),
('Salad', 4.50, (SELECT food_id FROM foods ORDER BY RAND() LIMIT 1)),
('Sandwich', 6.75, (SELECT food_id FROM foods ORDER BY RAND() LIMIT 1)),
('Sushi', 12.00, (SELECT food_id FROM foods ORDER BY RAND() LIMIT 1)),
('Taco', 3.99, (SELECT food_id FROM foods ORDER BY RAND() LIMIT 1)),
('Steak', 15.99, (SELECT food_id FROM foods ORDER BY RAND() LIMIT 1)),
('Soup', 4.99, (SELECT food_id FROM foods ORDER BY RAND() LIMIT 1)),
('Ice Cream', 2.99, (SELECT food_id FROM foods ORDER BY RAND() LIMIT 1));



SELECT * FROM restaurant r 




INSERT INTO restaurant (res_name, imgae, descs) VALUES
('Sunset Grill', 'sunset_grill.jpg', 'A cozy place with a beautiful sunset view.'),
('Ocean Breeze', 'ocean_breeze.png', 'Seafood restaurant with oceanfront dining.'),
('Mountain Dine', 'mountain_dine.jpg', 'Restaurant located in the mountains with a scenic view.'),
('Urban Eatery', 'urban_eatery.png', 'Modern restaurant in the heart of the city.'),
('Garden Delight', 'garden_delight.jpg', 'Vegetarian restaurant with a garden setting.'),
('Riverside Cafe', 'riverside_cafe.png', 'Cafe by the river with a relaxing atmosphere.'),
('Skyline Bistro', 'skyline_bistro.jpg', 'Bistro with a panoramic view of the city skyline.'),
('Forest Feast', 'forest_feast.png', 'Restaurant surrounded by a lush forest.'),
('Desert Oasis', 'desert_oasis.jpg', 'An oasis-themed restaurant in the desert.'),
('Lakeside Diner', 'lakeside_diner.png', 'Diner by the lake with a serene view.');






SELECT * FROM rate_res rr 

INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
((SELECT users_id FROM users ORDER BY RAND() LIMIT 1), (SELECT res_id FROM restaurant ORDER BY RAND() LIMIT 1), 5, '2023-12-01 12:00:00'),
((SELECT users_id FROM users ORDER BY RAND() LIMIT 1), (SELECT res_id FROM restaurant ORDER BY RAND() LIMIT 1), 4, '2023-12-02 13:00:00'),
((SELECT users_id FROM users ORDER BY RAND() LIMIT 1), (SELECT res_id FROM restaurant ORDER BY RAND() LIMIT 1), 3, '2023-12-03 14:00:00'),
((SELECT users_id FROM users ORDER BY RAND() LIMIT 1), (SELECT res_id FROM restaurant ORDER BY RAND() LIMIT 1), 5, '2023-12-04 15:00:00'),
((SELECT users_id FROM users ORDER BY RAND() LIMIT 1), (SELECT res_id FROM restaurant ORDER BY RAND() LIMIT 1), 4, '2023-12-05 16:00:00'),
((SELECT users_id FROM users ORDER BY RAND() LIMIT 1), (SELECT res_id FROM restaurant ORDER BY RAND() LIMIT 1), 3, '2023-12-06 17:00:00'),
((SELECT users_id FROM users ORDER BY RAND() LIMIT 1), (SELECT res_id FROM restaurant ORDER BY RAND() LIMIT 1), 5, '2023-12-07 18:00:00'),
((SELECT users_id FROM users ORDER BY RAND() LIMIT 1), (SELECT res_id FROM restaurant ORDER BY RAND() LIMIT 1), 4, '2023-12-08 19:00:00'),
((SELECT users_id FROM users ORDER BY RAND() LIMIT 1), (SELECT res_id FROM restaurant ORDER BY RAND() LIMIT 1), 3, '2023-12-09 20:00:00'),
((SELECT users_id FROM users ORDER BY RAND() LIMIT 1), (SELECT res_id FROM restaurant ORDER BY RAND() LIMIT 1), 5, '2023-12-10 21:00:00');





SELECT * FROM like_res lr WHERE users_id = '6a7c179b-b3c6-11ef-8240-0242ac110002'


INSERT INTO like_res (users_id, res_id, date_like) VALUES
((SELECT users_id FROM users ORDER BY RAND() LIMIT 1), (SELECT res_id FROM restaurant ORDER BY RAND() LIMIT 1), '2023-01-01 12:00:00'),
((SELECT users_id FROM users ORDER BY RAND() LIMIT 1), (SELECT res_id FROM restaurant ORDER BY RAND() LIMIT 1), '2023-02-01 13:00:00'),
((SELECT users_id FROM users ORDER BY RAND() LIMIT 1), (SELECT res_id FROM restaurant ORDER BY RAND() LIMIT 1), '2023-03-01 14:00:00'),
((SELECT users_id FROM users ORDER BY RAND() LIMIT 1), (SELECT res_id FROM restaurant ORDER BY RAND() LIMIT 1), '2023-04-01 15:00:00'),
((SELECT users_id FROM users ORDER BY RAND() LIMIT 1), (SELECT res_id FROM restaurant ORDER BY RAND() LIMIT 1), '2023-05-01 16:00:00'),
((SELECT users_id FROM users ORDER BY RAND() LIMIT 1), (SELECT res_id FROM restaurant ORDER BY RAND() LIMIT 1), '2023-06-01 17:00:00'),
((SELECT users_id FROM users ORDER BY RAND() LIMIT 1), (SELECT res_id FROM restaurant ORDER BY RAND() LIMIT 1), '2023-07-01 18:00:00'),
((SELECT users_id FROM users ORDER BY RAND() LIMIT 1), (SELECT res_id FROM restaurant ORDER BY RAND() LIMIT 1), '2023-08-01 19:00:00'),
((SELECT users_id FROM users ORDER BY RAND() LIMIT 1), (SELECT res_id FROM restaurant ORDER BY RAND() LIMIT 1), '2023-09-01 20:00:00'),
((SELECT users_id FROM users ORDER BY RAND() LIMIT 1), (SELECT res_id FROM restaurant ORDER BY RAND() LIMIT 1), '2023-10-01 21:00:00');



-- Tìm 5 người like nhà hàng nhiều nhất
SELECT u.full_name, lr.users_id , COUNT(lr.res_id) as tong_like
from like_res lr
left join users u on lr.users_id = u.users_id 
GROUP by lr.users_id 
ORDER by tong_like DESC 
limit 5;


-- Tìm 2 nhà hàng có lượt like nhiều nhất
SELECT r.res_name, count(lr.users_id) as nhahang_like 
from restaurant r 
left join like_res lr on r.res_id = lr.res_id 
GROUP by lr.res_id, r.res_name 
ORDER by nhahang_like desc
limit 2;


-- Tìm người đã đặt hàng nhiều nhất

SELECT o.user_id , u.full_name, COUNT(o.order_id) as order_dathang 
from orders o
left join users u ON o.user_id = u.users_id 
GROUP by o.user_id, u.full_name
ORDER by order_dathang DESC 
limit 1

-- Tìm người không hoạt động trong hệ thống

SELECT * 
from users u 
left join orders o ON u.users_id = o.user_id 
LEFT JOIN like_res lr on u.users_id = lr.users_id 
LEFT JOIN rate_res rr on u.users_id = rr.user_id 
WHERE o.user_id IS NULL and lr.users_id is null and rr.user_id is null 
