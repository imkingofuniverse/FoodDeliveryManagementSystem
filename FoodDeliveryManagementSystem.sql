/*------------------------------------- Create the database and tables-----------------------------*/
CREATE DATABASE FoodDeliveryManagementSystem;

-- Use the database
\c FoodDeliveryManagementSystem;

-- Create Customer table
CREATE TABLE Customer (
    customerId INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    contactNumber VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- Create Restaurant table
CREATE TABLE Restaurant (
    restaurantId INT PRIMARY KEY,
    restaurantName VARCHAR(100) NOT NULL,
    restaurantAddress VARCHAR(255) NOT NULL,
    restaurantRating DECIMAL(2,1),
    restaurantContact VARCHAR(15) NOT NULL,
    restaurantEmail VARCHAR(100) NOT NULL,
    cuisineType VARCHAR(50) NOT NULL
);

-- Create Menu table
CREATE TABLE Menu (
    itemId INT PRIMARY KEY,
    restaurantId INT REFERENCES Restaurant(restaurantId),
    itemName VARCHAR(100) NOT NULL,
    itemDescription TEXT,
    itemPrice DECIMAL(10,2) NOT NULL,
    itemType VARCHAR(50) NOT NULL
);

-- Create Order table
CREATE TABLE OrderTable (
    orderId INT PRIMARY KEY,
    customerId INT REFERENCES Customer(customerId),
    restaurantId INT REFERENCES Restaurant(restaurantId),
    orderDate DATE NOT NULL
);

-- Create Reservation table
CREATE TABLE Reservation (
    reservationId INT PRIMARY KEY,
    customerId INT REFERENCES Customer(customerId),
    restaurantId INT REFERENCES Restaurant(restaurantId),
    reservationDate DATE NOT NULL,
    numberOfPeople INT NOT NULL
);

-- Create Payment table
CREATE TABLE Payment (
    paymentId INT PRIMARY KEY,
    orderId INT REFERENCES OrderTable(orderId),
    transactionId VARCHAR(50) NOT NULL,
    paymentDate DATE NOT NULL,
    totalAmount DECIMAL(10,2) NOT NULL,
    paymentMethod VARCHAR(20) NOT NULL,
    paymentStatus VARCHAR(20) NOT NULL
);

-- Create Delivery table
CREATE TABLE Delivery (
    deliveryId INT PRIMARY KEY,
    orderId INT REFERENCES OrderTable(orderId),
    deliveryStatus VARCHAR(20) NOT NULL,
    deliveryDate DATE NOT NULL
);



/*------------------------------------- Insert values to Customer Table-----------------------------*/
INSERT INTO Customer (customerId, name, address, contactNumber, email) VALUES
(1001, 'Tony Stark', '123 Elm Street', '123-456-7890', 'tony@example.com'),
(1002, 'Steve Rogers', '456 Shield Ave', '987-654-3210', 'steve@example.com'),
(1003, 'Bruce Banner', '789 Gamma Rd', '654-987-1230', 'bruce@example.com'),
(1004, 'Natasha Romanoff', '321 Spy Lane', '543-210-9876', 'natasha@example.com'),
(1005, 'Clint Barton', '101 Archer St', '555-555-5555', 'clint@example.com'),
(1006, 'Thor Odinson', '500 Thunder Rd', '999-888-7777', 'thor@example.com'),
(1007, 'Peter Parker', '20 Queens Blvd', '888-777-6666', 'peter@example.com'),
(1008, 'Wanda Maximoff', '15 Scarlet Ln', '333-333-4444', 'wanda@example.com'),
(1009, 'Vision', '42 Vibranium Rd', '222-222-5555', 'vision@example.com'),
(1010, 'Stephen Strange', '177A Bleecker St', '111-111-1234', 'strange@example.com'),
(1011, 'Sam Wilson', '98 Falcon Rd', '321-654-9870', 'sam@example.com'),
(1012, 'Bucky Barnes', '34 Winter Soldier Ave', '432-987-1234', 'bucky@example.com'),
(1013, 'Scott Lang', '10 Ant Hill', '543-321-7890', 'scott@example.com'),
(1014, 'Hope Van Dyne', '88 Wasp Ln', '654-123-4321', 'hope@example.com'),
(1015, 'Carol Danvers', '99 Captain Rd', '765-987-3456', 'carol@example.com'),
(1016, 'Nick Fury', '7 S.H.I.E.L.D. HQ', '123-123-1234', 'nick@example.com'),
(1017, 'T’Challa', '1 Wakanda Ave', '999-999-1234', 'tchalla@example.com'),
(1018, 'Shuri', '2 Wakanda Tech St', '888-888-1234', 'shuri@example.com'),
(1019, 'Loki Laufeyson', '10 Mischief Ln', '777-777-4321', 'loki@example.com'),
(1020, 'Gamora', '30 Titan Way', '666-666-1234', 'gamora@example.com'),
(1021, 'Star-Lord', '50 Galaxy Rd', '555-555-4321', 'starlord@example.com'),
(1022, 'Drax', '25 Destroyer Rd', '444-444-1234', 'drax@example.com'),
(1023, 'Rocket Raccoon', '100 Trash Panda Ln', '333-333-1234', 'rocket@example.com'),
(1024, 'Groot', '200 Tree Rd', '222-222-4321', 'groot@example.com'),
(1025, 'Nebula', '300 Revenge Blvd', '111-111-1111', 'nebula@example.com'),
(1026, 'Mantis', '400 Empath Rd', '123-123-9999', 'mantis@example.com'),
(1027, 'Yondu', '500 Ravager Rd', '987-987-6543', 'yondu@example.com'),
(1028, 'Hawkeye', '600 Bow St', '888-888-6666', 'hawkeye@example.com'),
(1029, 'Ant-Man', '50 Smallville', '654-654-7654', 'antman@example.com'),
(1030, 'Black Panther', '1 Vibranium St', '567-567-5678', 'blackpanther@example.com');

/*------------------------------------- Insert values to Restaurant Table-----------------------------*/
INSERT INTO Restaurant (restaurantId, restaurantName, restaurantAddress, restaurantRating, restaurantContact, restaurantEmail, cuisineType) VALUES
(3001, 'Food Paradise', '101 Main Street', 4.5, '111-111-1111', 'paradise@food.com', 'Italian'),
(3002, 'Spice Garden', '202 Spice Avenue', 4.3, '222-222-2222', 'spicegarden@food.com', 'Indian'),
(3003, 'Burger Hub', '303 Burger Lane', 4.0, '333-333-3333', 'burgerhub@food.com', 'American'),
(3004, 'Pizza Planet', '404 Cheese Street', 4.8, '444-444-4444', 'pizzaplanet@food.com', 'Italian'),
(3005, 'Taco Town', '505 Fiesta Road', 4.2, '555-555-5555', 'tacotown@food.com', 'Mexican'),
(3006, 'Noodle House', '606 Chopstick Lane', 4.1, '666-666-6666', 'noodlehouse@food.com', 'Chinese'),
(3007, 'Sushi World', '707 Wasabi Drive', 4.7, '777-777-7777', 'sushiworld@food.com', 'Japanese'),
(3008, 'Curry Corner', '808 Spice Blvd', 4.4, '888-888-8888', 'currycorner@food.com', 'Indian'),
(3009, 'Grill Station', '909 BBQ Street', 4.3, '999-999-9999', 'grillstation@food.com', 'Barbecue'),
(3010, 'Vegan Delight', '1010 Green Avenue', 4.6, '101-101-1010', 'vegandelight@food.com', 'Vegan'),
(3011, 'Pasta Palace', '1111 Italy Street', 4.7, '202-202-2020', 'pastapalace@food.com', 'Italian'),
(3012, 'The Salad Bar', '1212 Healthy Road', 4.2, '303-303-3030', 'saladbar@food.com', 'Healthy'),
(3013, 'Steakhouse Grill', '1313 Tenderloin Blvd', 4.5, '404-404-4040', 'steakhouse@food.com', 'Steakhouse'),
(3014, 'Breakfast Bliss', '1414 Sunrise Lane', 4.3, '505-505-5050', 'breakfastbliss@food.com', 'Breakfast'),
(3015, 'Falafel King', '1515 Pita Street', 4.4, '606-606-6060', 'falafelking@food.com', 'Middle Eastern'),
(3016, 'Seafood Shack', '1616 Ocean Drive', 4.6, '707-707-7070', 'seafoodshack@food.com', 'Seafood'),
(3017, 'Dessert Haven', '1717 Sweet Street', 4.9, '808-808-8080', 'desserthaven@food.com', 'Desserts'),
(3018, 'BBQ Bliss', '1818 Smoke Lane', 4.2, '909-909-9090', 'bbqbliss@food.com', 'Barbecue'),
(3019, 'Pho Place', '1919 Noodle Road', 4.4, '111-222-3333', 'phoplace@food.com', 'Vietnamese'),
(3020, 'Crepe Corner', '2020 French Lane', 4.3, '444-555-6666', 'crepecorner@food.com', 'French'),
(3021, 'Waffle Wonders', '2121 Breakfast Blvd', 4.8, '777-888-9999', 'wafflewonders@food.com', 'Breakfast'),
(3022, 'Dim Sum Delight', '2222 Dumpling Drive', 4.5, '888-999-0000', 'dimsumdelight@food.com', 'Chinese'),
(3023, 'Ramen Republic', '2323 Noodle Lane', 4.6, '111-333-4444', 'ramenrepublic@food.com', 'Japanese'),
(3024, 'Burger Barn', '2424 Patty Place', 4.0, '222-444-5555', 'burgerbarn@food.com', 'American'),
(3025, 'Tikka Junction', '2525 Spice Blvd', 4.3, '333-555-6666', 'tikkajunction@food.com', 'Indian'),
(3026, 'Gourmet Grains', '2626 Whole Grain Road', 4.4, '444-666-7777', 'gourmetgrains@food.com', 'Healthy'),
(3027, 'Fusion Flavors', '2727 Mix Street', 4.7, '555-777-8888', 'fusionflavors@food.com', 'Fusion'),
(3028, 'Biryani Bazaar', '2828 Rice Avenue', 4.6, '666-888-9999', 'biryanibazaar@food.com', 'Indian'),
(3029, 'Café Paris', '2929 Eiffel Lane', 4.9, '777-999-1111', 'cafeparis@food.com', 'French'),
(3030, 'Kebab Kitchen', '3030 Grill Lane', 4.4, '888-000-2222', 'kebabkitchen@food.com', 'Middle Eastern');

/*------------------------------------- Insert values to Menu Table-----------------------------*/
INSERT INTO Menu (itemId, restaurantId, itemName, itemDescription, itemPrice, itemType) 
VALUES
-- Food Paradise (Italian)
(4001, 3001, 'Margherita Pizza', 'Classic pizza topped with tomato, mozzarella, and basil', 350.00, 'Main Course'),
(4002, 3001, 'Pasta Alfredo', 'Creamy white sauce pasta with parmesan cheese', 300.00, 'Main Course'),
(4003, 3001, 'Bruschetta', 'Toasted bread topped with tomato, garlic, and basil', 150.00, 'Appetizer'),
(4004, 3001, 'Tiramisu', 'Classic Italian dessert made with mascarpone and coffee', 250.00, 'Dessert'),
(4005, 3001, 'Minestrone Soup', 'Healthy Italian vegetable soup with pasta', 180.00, 'Starter'),

-- Spice Garden (Indian)
(4006, 3002, 'Chicken Tikka Masala', 'Grilled chicken in rich tomato-based gravy', 280.00, 'Main Course'),
(4007, 3002, 'Naan Bread', 'Soft Indian flatbread cooked in a tandoor', 40.00, 'Bread'),
(4008, 3002, 'Palak Paneer', 'Cottage cheese in creamy spinach curry', 240.00, 'Main Course'),
(4009, 3002, 'Samosa', 'Fried pastry filled with spiced potatoes and peas', 50.00, 'Appetizer'),
(4010, 3002, 'Rasgulla', 'Spongy cottage cheese balls soaked in syrup', 80.00, 'Dessert'),

-- Burger Hub (American)
(4011, 3003, 'Cheeseburger', 'Beef patty with melted cheese, lettuce, and tomato', 200.00, 'Main Course'),
(4012, 3003, 'French Fries', 'Crispy potato fries served with ketchup', 100.00, 'Side'),
(4013, 3003, 'BBQ Chicken Burger', 'Burger with tangy BBQ chicken and lettuce', 220.00, 'Main Course'),
(4014, 3003, 'Onion Rings', 'Crispy fried onion rings', 120.00, 'Appetizer'),
(4015, 3003, 'Chocolate Milkshake', 'Thick milkshake with chocolate syrup and cream', 150.00, 'Beverage'),

-- Pizza Planet (Italian)
(4016, 3004, 'Pepperoni Pizza', 'Pizza with tomato sauce, mozzarella, and pepperoni', 380.00, 'Main Course'),
(4017, 3004, 'Four Cheese Pizza', 'Pizza topped with four types of cheese', 400.00, 'Main Course'),
(4018, 3004, 'Garlic Bread', 'Toasted bread with garlic butter and herbs', 150.00, 'Appetizer'),
(4019, 3004, 'Panna Cotta', 'Creamy Italian dessert served with berry sauce', 220.00, 'Dessert'),
(4020, 3004, 'Caprese Salad', 'Tomato, mozzarella, and basil drizzled with olive oil', 180.00, 'Starter'),

-- Taco Town (Mexican)
(4021, 3005, 'Beef Tacos', 'Soft tacos filled with spiced beef and vegetables', 200.00, 'Main Course'),
(4022, 3005, 'Nachos', 'Crispy tortilla chips topped with cheese and jalapenos', 180.00, 'Appetizer'),
(4023, 3005, 'Chicken Enchiladas', 'Tortillas filled with chicken and baked with sauce', 250.00, 'Main Course'),
(4024, 3005, 'Churros', 'Fried dough pastry coated in cinnamon sugar', 120.00, 'Dessert'),
(4025, 3005, 'Guacamole', 'Creamy avocado dip served with tortilla chips', 150.00, 'Starter'),

-- Noodle House (Chinese)
(4026, 3006, 'Hakka Noodles', 'Stir-fried noodles with vegetables and soy sauce', 200.00, 'Main Course'),
(4027, 3006, 'Spring Rolls', 'Crispy rolls filled with spiced vegetables', 150.00, 'Appetizer'),
(4028, 3006, 'Kung Pao Chicken', 'Spicy stir-fried chicken with peanuts', 280.00, 'Main Course'),
(4029, 3006, 'Manchow Soup', 'Spicy Chinese soup with fried noodles', 120.00, 'Starter'),
(4030, 3006, 'Fried Rice', 'Rice stir-fried with vegetables and soy sauce', 180.00, 'Main Course'),

-- Sushi World (Japanese)
(4031, 3007, 'California Roll', 'Sushi roll with crab, avocado, and cucumber', 300.00, 'Main Course'),
(4032, 3007, 'Miso Soup', 'Traditional Japanese soup with tofu and seaweed', 150.00, 'Starter'),
(4033, 3007, 'Teriyaki Chicken', 'Grilled chicken with sweet soy-based sauce', 320.00, 'Main Course'),
(4034, 3007, 'Tempura', 'Deep-fried shrimp and vegetables', 250.00, 'Appetizer'),
(4035, 3007, 'Green Tea Ice Cream', 'Ice cream flavored with matcha', 150.00, 'Dessert'),

-- Curry Corner (Indian)
(4036, 3008, 'Butter Chicken', 'Tender chicken cooked in creamy tomato gravy', 300.00, 'Main Course'),
(4037, 3008, 'Dal Tadka', 'Lentils cooked with aromatic spices and butter', 180.00, 'Main Course'),
(4038, 3008, 'Tandoori Roti', 'Whole wheat flatbread cooked in a tandoor', 30.00, 'Bread'),
(4039, 3008, 'Gulab Jamun', 'Sweet dumplings soaked in sugar syrup', 90.00, 'Dessert'),
(4040, 3008, 'Chicken Biryani', 'Aromatic basmati rice cooked with spiced chicken', 250.00, 'Main Course'),

-- Grill Station (Barbecue)
(4041, 3009, 'BBQ Ribs', 'Slow-cooked ribs glazed with BBQ sauce', 350.00, 'Main Course'),
(4042, 3009, 'Grilled Chicken Wings', 'Spicy and smoky grilled chicken wings', 200.00, 'Appetizer'),
(4043, 3009, 'Smoked Brisket', 'Juicy beef brisket smoked to perfection', 400.00, 'Main Course'),
(4044, 3009, 'Cornbread', 'Classic BBQ side with a hint of sweetness', 80.00, 'Side'),
(4045, 3009, 'Coleslaw', 'Crunchy cabbage salad with creamy dressing', 100.00, 'Side'),

-- Vegan Delight (Vegan)
(4046, 3010, 'Quinoa Salad', 'Healthy salad with quinoa, veggies, and vinaigrette', 200.00, 'Main Course'),
(4047, 3010, 'Vegan Burger', 'Plant-based patty with lettuce and tomato', 250.00, 'Main Course'),
(4048, 3010, 'Vegan Brownie', 'Rich chocolate brownie made without dairy', 150.00, 'Dessert'),
(4049, 3010, 'Lentil Soup', 'Hearty soup made with lentils and spices', 120.00, 'Starter'),
(4050, 3010, 'Stuffed Bell Peppers', 'Bell peppers filled with quinoa and veggies', 220.00, 'Main Course'),

-- Pasta Palace (Italian)
(4051, 3011, 'Fettuccine Carbonara', 'Creamy pasta with bacon and parmesan', 320.00, 'Main Course'),
(4052, 3011, 'Garlic Knots', 'Soft bread knots brushed with garlic butter', 140.00, 'Appetizer'),
(4053, 3011, 'Lasagna', 'Layered pasta with meat, cheese, and tomato sauce', 400.00, 'Main Course'),
(4054, 3011, 'Cannoli', 'Sweet pastry filled with ricotta cheese', 180.00, 'Dessert'),
(4055, 3011, 'Caesar Salad', 'Crispy romaine lettuce with Caesar dressing', 160.00, 'Starter'),

-- The Salad Bar (Healthy)
(4056, 3012, 'Greek Salad', 'Salad with olives, feta, and fresh veggies', 180.00, 'Main Course'),
(4057, 3012, 'Kale Smoothie', 'Healthy smoothie made with kale and fruits', 150.00, 'Beverage'),
(4058, 3012, 'Avocado Toast', 'Whole-grain toast topped with mashed avocado', 200.00, 'Appetizer'),
(4059, 3012, 'Fruit Salad', 'Seasonal fruits tossed in honey and lime', 180.00, 'Dessert'),
(4060, 3012, 'Lentil Salad', 'Protein-packed salad with lentils and veggies', 190.00, 'Main Course');

/*------------------------------------- Insert values to Order Table-----------------------------*/
INSERT INTO OrderTable (orderId, customerId, restaurantId, orderDate)
VALUES
(2001, 1001, 3001, '2024-10-28'),
(2002, 1002, 3002, '2024-10-29'),
(2003, 1003, 3003, '2024-10-30'),
(2004, 1004, 3004, '2024-10-31'),
(2005, 1005, 3005, '2024-11-01'),
(2006, 1006, 3006, '2024-11-02'),
(2007, 1007, 3007, '2024-11-03'),
(2008, 1008, 3008, '2024-11-04'),
(2009, 1009, 3009, '2024-11-05'),
(2010, 1010, 3010, '2024-11-06'),
(2011, 1011, 3011, '2024-11-07'),
(2012, 1012, 3012, '2024-11-08'),
(2013, 1013, 3013, '2024-11-09'),
(2014, 1014, 3014, '2024-11-10'),
(2015, 1015, 3015, '2024-11-11'),
(2016, 1016, 3016, '2024-11-12'),
(2017, 1017, 3017, '2024-11-13'),
(2018, 1018, 3018, '2024-11-14'),
(2019, 1019, 3019, '2024-11-15'),
(2020, 1020, 3020, '2024-11-16'),
(2021, 1021, 3021, '2024-11-17'),
(2022, 1022, 3022, '2024-11-18'),
(2023, 1023, 3023, '2024-11-19'),
(2024, 1024, 3024, '2024-11-20'),
(2025, 1025, 3025, '2024-11-21'),
(2026, 1026, 3026, '2024-11-22'),
(2027, 1027, 3027, '2024-11-23'),
(2028, 1028, 3028, '2024-11-24'),
(2029, 1029, 3029, '2024-11-25'),
(2030, 1030, 3030, '2024-11-26');

/*------------------------------------- Insert values to Reservation Table-----------------------------*/
INSERT INTO Reservation (reservationId, customerId, restaurantId, reservationDate, numberOfPeople)
VALUES
(7001, 1001, 3001, '2024-11-05', 4),
(7002, 1002, 3002, '2024-11-06', 2),
(7003, 1003, 3003, '2024-11-07', 6),
(7004, 1004, 3004, '2024-11-08', 3),
(7005, 1005, 3005, '2024-11-09', 5),
(7006, 1006, 3006, '2024-11-10', 2),
(7007, 1007, 3007, '2024-11-11', 7),
(7008, 1008, 3008, '2024-11-12', 4),
(7009, 1009, 3009, '2024-11-13', 3),
(7010, 1010, 3010, '2024-11-14', 6),
(7011, 1011, 3011, '2024-11-15', 2),
(7012, 1012, 3012, '2024-11-16', 5),
(7013, 1013, 3013, '2024-11-17', 4),
(7014, 1014, 3014, '2024-11-18', 8),
(7015, 1015, 3015, '2024-11-19', 3),
(7016, 1016, 3016, '2024-11-20', 7),
(7017, 1017, 3017, '2024-11-21', 2),
(7018, 1018, 3018, '2024-11-22', 5),
(7019, 1019, 3019, '2024-11-23', 4),
(7020, 1020, 3020, '2024-11-24', 6),
(7021, 1021, 3021, '2024-11-25', 3),
(7022, 1022, 3022, '2024-11-26', 4),
(7023, 1023, 3023, '2024-11-27', 8),
(7024, 1024, 3024, '2024-11-28', 2),
(7025, 1025, 3025, '2024-11-29', 5),
(7026, 1026, 3026, '2024-11-30', 3),
(7027, 1027, 3027, '2024-12-01', 7),
(7028, 1028, 3028, '2024-12-02', 6),
(7029, 1029, 3029, '2024-12-03', 2),
(7030, 1030, 3030, '2024-12-04', 4);


/*------------------------------------- Insert values to Payment Table-----------------------------*/
INSERT INTO Payment (paymentId, orderId, transactionId, paymentDate, totalAmount, paymentMethod, paymentStatus)
VALUES
(4001, 2001, 'TXN12345', '2024-10-28', 150.00, 'Card', 'Paid'),
(4002, 2002, 'TXN67890', '2024-10-29', 200.00, 'Cash', 'Paid'),
(4003, 2003, 'TXN34567', '2024-10-30', 120.00, 'UPI', 'Paid'),
(4004, 2004, 'TXN45678', '2024-10-31', 180.00, 'Net Banking', 'Paid'),
(4005, 2005, 'TXN56789', '2024-11-01', 250.00, 'Card', 'Paid'),
(4006, 2006, 'TXN67891', '2024-11-02', 175.00, 'Cash', 'Paid'),
(4007, 2007, 'TXN78912', '2024-11-03', 220.00, 'UPI', 'Pending'),
(4008, 2008, 'TXN89123', '2024-11-04', 130.00, 'Card', 'Paid'),
(4009, 2009, 'TXN91234', '2024-11-05', 145.00, 'Net Banking', 'Paid'),
(4010, 2010, 'TXN12346', '2024-11-06', 165.00, 'Card', 'Paid'),
(4011, 2011, 'TXN23457', '2024-11-07', 210.00, 'Cash', 'Paid'),
(4012, 2012, 'TXN34568', '2024-11-08', 140.00, 'UPI', 'Paid'),
(4013, 2013, 'TXN45679', '2024-11-09', 195.00, 'Net Banking', 'Pending'),
(4014, 2014, 'TXN56790', '2024-11-10', 205.00, 'Card', 'Paid'),
(4015, 2015, 'TXN67892', '2024-11-11', 135.00, 'Cash', 'Paid'),
(4016, 2016, 'TXN78913', '2024-11-12', 185.00, 'UPI', 'Paid'),
(4017, 2017, 'TXN89124', '2024-11-13', 160.00, 'Net Banking', 'Paid'),
(4018, 2018, 'TXN91235', '2024-11-14', 175.00, 'Card', 'Paid'),
(4019, 2019, 'TXN12347', '2024-11-15', 190.00, 'Cash', 'Paid'),
(4020, 2020, 'TXN23458', '2024-11-16', 225.00, 'UPI', 'Paid'),
(4021, 2021, 'TXN34569', '2024-11-17', 155.00, 'Card', 'Pending'),
(4022, 2022, 'TXN45680', '2024-11-18', 175.00, 'Net Banking', 'Paid'),
(4023, 2023, 'TXN56791', '2024-11-19', 195.00, 'Cash', 'Paid'),
(4024, 2024, 'TXN67893', '2024-11-20', 180.00, 'UPI', 'Paid'),
(4025, 2025, 'TXN78914', '2024-11-21', 165.00, 'Card', 'Paid'),
(4026, 2026, 'TXN89125', '2024-11-22', 140.00, 'Cash', 'Paid'),
(4027, 2027, 'TXN91236', '2024-11-23', 200.00, 'Net Banking', 'Paid'),
(4028, 2028, 'TXN12348', '2024-11-24', 230.00, 'Card', 'Pending'),
(4029, 2029, 'TXN23459', '2024-11-25', 215.00, 'UPI', 'Paid'),
(4030, 2030, 'TXN34570', '2024-11-26', 145.00, 'Cash', 'Paid');

/*------------------------------------- Insert values to Delivery Table-----------------------------*/
INSERT INTO Delivery (deliveryId, orderId, deliveryStatus, deliveryDate)
VALUES
(5001, 2001, 'Delivered', '2024-10-29'),
(5002, 2002, 'Pending', '2024-10-30'),
(5003, 2003, 'Delivered', '2024-10-31'),
(5004, 2004, 'Pending', '2024-11-01'),
(5005, 2005, 'Delivered', '2024-11-02'),
(5006, 2006, 'Pending', '2024-11-03'),
(5007, 2007, 'Delivered', '2024-11-04'),
(5008, 2008, 'Pending', '2024-11-05'),
(5009, 2009, 'Delivered', '2024-11-06'),
(5010, 2010, 'Pending', '2024-11-07'),
(5011, 2011, 'Delivered', '2024-11-08'),
(5012, 2012, 'Pending', '2024-11-09'),
(5013, 2013, 'Delivered', '2024-11-10'),
(5014, 2014, 'Pending', '2024-11-11'),
(5015, 2015, 'Delivered', '2024-11-12'),
(5016, 2016, 'Pending', '2024-11-13'),
(5017, 2017, 'Delivered', '2024-11-14'),
(5018, 2018, 'Pending', '2024-11-15'),
(5019, 2019, 'Delivered', '2024-11-16'),
(5020, 2020, 'Pending', '2024-11-17'),
(5021, 2021, 'Delivered', '2024-11-18'),
(5022, 2022, 'Pending', '2024-11-19'),
(5023, 2023, 'Delivered', '2024-11-20'),
(5024, 2024, 'Pending', '2024-11-21'),
(5025, 2025, 'Delivered', '2024-11-22'),
(5026, 2026, 'Pending', '2024-11-23'),
(5027, 2027, 'Delivered', '2024-11-24'),
(5028, 2028, 'Pending', '2024-11-25'),
(5029, 2029, 'Delivered', '2024-11-26'),
(5030, 2030, 'Pending', '2024-11-27');