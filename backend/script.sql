--THIS IS HERE ONLY FOR TESTING PORPUSES TO PUPULATE MY DATABASE WITH SOME DATA

INSERT INTO posts (title, description, address, category, specialRequirments, preferredInterval, preferredDays, payCash, payCard, price, isNegotiable, image, isDone, userID, serviceProviderID, createdAt, updatedAt)
VALUES
    ('Furniture Assembly', 'Need help assembling furniture', '123 Main St', 'Furniture', 'Assembly skills required', 'Weekdays', 'Monday, Wednesday', true, false, 50, true, 'furniture_assembly.jpg', false, 1, 2, NOW(), NOW() ),
    ('Garden Maintenance', 'Looking for someone to maintain my garden', '456 Oak St', 'Garden', 'Experience in garden maintenance', 'Weekends', 'Saturday, Sunday', true, true, 30, false, 'garden_maintenance.jpg', false, 2, 3, NOW(), NOW() ),
    ('Plumbing Repairs', 'Need assistance with plumbing issues', '789 Elm St', 'Plumbing', 'Plumbing skills required', 'Daily', 'Everyday', true, false, 20, true, 'plumbing_repairs.jpg', false, 3, 4, NOW(), NOW() ),
    ('Electrical Repairs', 'Looking for someone to fix electrical issues', '101 Pine St', 'Electrical Work', 'Knowledge of electrical repairs', 'Weekdays', 'Tuesday, Thursday', false, true, 25, true, 'electrical_repairs.jpg', false, 4, 5, NOW(), NOW() ),
    ('Door Installation', 'Install a new door in my house', '202 Maple St', 'Doors', 'Door installation skills required', 'Weekdays', 'Monday, Friday', true, false, 100, true, 'door_installation.jpg', false, 5, 6, NOW(), NOW() ),
    ('Heating System Check', 'Need a checkup for my heating system', '303 Cedar St', 'Heating', 'Experience in heating systems', 'Weekdays', 'Wednesday, Friday', false, true, 40, true, 'heating_system_check.jpg', false, 6, 7, NOW(), NOW() ),
    ('Plumbing Assistance', 'Looking for plumbing assistance', '404 Birch St', 'Plumbing', 'Plumbing skills required', 'Weekends', 'Saturday, Sunday', true, false, 15, false, 'plumbing_assistance.jpg', false, 7, 8, NOW(), NOW() ),
    ('Car Electrical Repairs', 'Fix electrical issues in my car', '505 Walnut St', 'Automotive', 'Car electrical repair skills required', 'Weekdays', 'Tuesday, Thursday', true, false, 80, true, 'car_electrical_repairs.jpg', false, 8, 9, NOW(), NOW() ),
    ('Outdoor Photography', 'Capture outdoor portraits', '606 Oak St', 'Photography', 'Outdoor photography skills required', 'Weekends', 'Sunday', true, false, 60, true, 'outdoor_photography.jpg', false, 9, 10, NOW(), NOW() ),
    ('Event Lighting Setup', 'Help with lighting setup for an event', '707 Pine St', 'Event Services', 'Experience in event lighting', 'Weekends', 'Saturday', true, true, 70, false, 'event_lighting_setup.jpg', false, 10, 11, NOW(), NOW() ),
    ('Fitness Equipment Installation', 'Install fitness equipment at my home', '808 Cedar St', 'Plumbing', 'Installation skills required', 'Weekdays', 'Monday, Wednesday', true, false, 55, true, 'fitness_equipment_installation.jpg', false, 11, 12, NOW(), NOW() ),
    ('Home Repairs', 'Fix various household issues', '909 Maple St', 'Plumbing', 'General handyman skills', 'Weekdays', 'Thursday, Friday', true, false, 90, true, 'home_repairs.jpg', false, 12, 13, NOW(), NOW() ),
    ('Language Exchange Sessions', 'Language exchange sessions for beginners', '1010 Elm St', 'Electrical Work', 'Fluent in multiple languages', 'Weekdays', 'Tuesday, Thursday', false, true, 35, true, 'language_exchange_sessions.jpg', false, 13, 14, NOW(), NOW() ),
    ('Graphic Design for Furniture', 'Create a logo for my furniture business', '1111 Pine St', 'Furniture', 'Creative and unique designs for furniture', 'Weekdays', 'Monday, Wednesday', true, false, 75, true, 'graphic_design_furniture.jpg', false, 14, 15, NOW(), NOW() );


INSERT INTO users (fullname, password, email, isServiceProvider, rating, address, phone, createdAt, updatedAt)
VALUES
    ('John Doe', 'password1', 'john.doe@email.com', 0, 4, '123 Main St', '555-1234', NOW(), NOW() ),
    ('Jane Smith', 'password2', 'jane.smith@email.com', 1, 5, '456 Oak St', '555-5678', NOW(), NOW() ),
    ('Alice Johnson', 'password3', 'alice.johnson@email.com', 0, NULL, NULL, NULL, NOW(), NOW() ),
    ('Bob Williams', 'password4', 'bob.williams@email.com', 1, NULL, NULL, NULL, NOW(), NOW() ),
    ('Eva Davis', 'password5', 'eva.davis@email.com', 0, 3, '789 Elm St', '555-9012', NOW(), NOW() ),
    ('Michael Brown', 'password6', 'michael.brown@email.com', 1, 4, '101 Pine St', '555-3456', NOW(), NOW() ),
    ('Olivia Lee', 'password7', 'olivia.lee@email.com', 0, NULL, NULL, NULL, NOW(), NOW() ),
    ('Daniel Miller', 'password8', 'daniel.miller@email.com', 1, 5, '202 Maple St', '555-7890', NOW(), NOW() ),
    ('Sophia Wilson', 'password9', 'sophia.wilson@email.com', 0, 4, '303 Cedar St', '555-2345', NOW(), NOW() ),
    ('David Taylor', 'password10', 'david.taylor@email.com', 1, NULL, NULL, NULL, NOW(), NOW() ),
    ('Emma Anderson', 'password11', 'emma.anderson@email.com', 0, 5, '404 Birch St', '555-6789', NOW(), NOW() ),
    ('James White', 'password12', 'james.white@email.com', 1, 4, '505 Walnut St', '555-1234', NOW(), NOW() ),
    ('Mia Harris', 'password13', 'mia.harris@email.com', 0, 3, '606 Oak St', '555-5678', NOW(), NOW() ),
    ('William Martin', 'password14', 'william.martin@email.com', 1, 5, '707 Pine St', '555-9012', NOW(), NOW() ),
    ('Ava Garcia', 'password15', 'ava.garcia@email.com', 0, NULL, NULL, NULL, NOW(), NOW() ),
    ('Liam Martinez', 'password16', 'liam.martinez@email.com', 1, 4, '808 Cedar St', '555-3456', NOW(), NOW() ),
    ('Emily Moore', 'password17', 'emily.moore@email.com', 0, 5, '909 Maple St', '555-7890', NOW(), NOW() ),
    ('Benjamin Johnson', 'password18', 'benjamin.johnson@email.com', 1, 3, '1010 Elm St', '555-2345', NOW(), NOW() ),
    ('Abigail Davis', 'password19', 'abigail.davis@email.com', 0, NULL, NULL, NULL, NOW(), NOW() ),
    ('Logan Brown', 'password20', 'logan.brown@email.com', 1, 4, '1111 Pine St', '555-6789', NOW(), NOW() );

