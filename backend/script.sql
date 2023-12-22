--THIS IS HERE ONLY FOR TESTING PORPUSES TO PUPULATE MY DATABASE WITH SOME DATA

INSERT INTO posts (title, description, address, category, specialRequirments, preferredInterval, preferredDays, payCash, payCard, price, isNegotiable, image, isDone, userID, serviceProviderID, createdAt, updatedAt)
VALUES
    ('House Cleaning', 'Looking for someone to clean my house', '123 Main St', 'Cleaning', 'No special requirements', 'Weekdays', 'Monday, Wednesday', true, false, 50, true, 'house_cleaning.jpg', false, 1, 2, NOW(), NOW() ),
    ('Gardening Help', 'Need assistance with gardening work', '456 Oak St', 'Gardening', 'Bring your own tools', 'Weekends', 'Saturday, Sunday', true, true, 30, false, 'gardening.jpg', false, 2, 3, NOW(), NOW() ),
    ('Dog Walking', 'Walk my dog every evening', '789 Elm St', 'Pet Care', 'Handle with care', 'Daily', 'Everyday', true, false, 20, true, 'dog_walking.jpg', false, 3, 4, NOW(), NOW() ),
    ('Tutoring', 'Looking for a math tutor', '101 Pine St', 'Education', 'High school level', 'Weekdays', 'Tuesday, Thursday', false, true, 25, true, 'tutoring.jpg', false, 4, 5, NOW(), NOW() ),
    ('Painting Service', 'Paint a room in my house', '202 Maple St', 'Home Improvement', 'No special requirements', 'Weekdays', 'Monday, Friday', true, false, 100, true, 'painting.jpg', false, 5, 6, NOW(), NOW() ),
    ('Tech Support', 'Need help setting up my computer', '303 Cedar St', 'Technology', 'Experience with Windows', 'Weekdays', 'Wednesday, Friday', false, true, 40, true, 'tech_support.jpg', false, 6, 7, NOW(), NOW() ),
    ('Babysitting', 'Looking for a reliable babysitter', '404 Birch St', 'Child Care', 'Experience with infants', 'Weekends', 'Saturday, Sunday', true, false, 15, false, 'babysitting.jpg', false, 7, 8, NOW(), NOW() ),
    ('Car Repair', 'Fix a minor issue with my car', '505 Walnut St', 'Automotive', 'Knowledge of car engines', 'Weekdays', 'Tuesday, Thursday', true, false, 80, true, 'car_repair.jpg', false, 8, 9, NOW(), NOW() ),
    ('Photography Session', 'Capture family portraits', '606 Oak St', 'Photography', 'Outdoor session preferred', 'Weekends', 'Sunday', true, false, 60, true, 'photography.jpg', false, 9, 10, NOW(), NOW() ),
    ('Event Planning', 'Help plan a birthday party', '707 Pine St', 'Event Services', 'Creative ideas welcome', 'Weekends', 'Saturday', true, true, 70, false, 'event_planning.jpg', false, 10, 11, NOW(), NOW() ),
    ('Fitness Training', 'Personal fitness trainer needed', '808 Cedar St', 'Fitness', 'Certified trainer preferred', 'Weekdays', 'Monday, Wednesday', true, false, 55, true, 'fitness_training.jpg', false, 11, 12, NOW(), NOW() ),
    ('Handyman Services', 'Fix various household issues', '909 Maple St', 'Home Repair', 'General handyman skills', 'Weekdays', 'Thursday, Friday', true, false, 90, true, 'handyman.jpg', false, 12, 13, NOW(), NOW() ),
    ('Language Tutoring', 'Learn a new language', '1010 Elm St', 'Education', 'Fluent in the target language', 'Weekdays', 'Tuesday, Thursday', false, true, 35, true, 'language_tutoring.jpg', false, 13, 14, NOW(), NOW() ),
    ('Graphic Design', 'Create a logo for my business', '1111 Pine St', 'Design', 'Creative and unique designs', 'Weekdays', 'Monday, Wednesday', true, false, 75, true, 'graphic_design.jpg', false, 14, 15, NOW(), NOW() );


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

