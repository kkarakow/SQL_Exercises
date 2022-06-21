INSERT INTO locations (location_id, location_name, location_address, location_telephone,
location_email, coach_id) 
VALUES(1, 'Midtown', '123 Main st', 123456789, 'midtown@location.com', 1);
INSERT INTO locations (location_id, location_name, location_address, location_telephone,
location_email, coach_id) 
VALUES(2, 'Cabbagetown', '123 Main st', 123456789, 'cabbagetown@location.com', 2);
INSERT INTO locations (location_id, location_name, location_address, location_telephone,
location_email, coach_id) 
VALUES(3, 'EastView', '123 Main st', 123456789, 'EastView@location.com', 3);

INSERT INTO Location_Coaches (Location_ID, Coach_ID) VALUES(1, 1);
INSERT INTO Location_Coaches (Location_ID, Coach_ID) VALUES(1, 2);
INSERT INTO Location_Coaches (Location_ID, Coach_ID) VALUES(1, 3);
INSERT INTO Location_Coaches (Location_ID, Coach_ID) VALUES(1, 4);

INSERT INTO Coaches (Coach_ID, Coach_Name, Coach_Level, Coach_Rating, Coach_Notes, Location_ID)
VALUES(1, 'Sayed', 3, 4, 'testtest', 1);
INSERT INTO Coaches (Coach_ID, Coach_Name, Coach_Level, Coach_Rating, Coach_Notes, Location_ID)
VALUES(2, 'Layla', 2, 5, 'testtest', 1);
INSERT INTO Coaches (Coach_ID, Coach_Name, Coach_Level, Coach_Rating, Coach_Notes, Location_ID)
VALUES(3, 'Sally', 1, 4, 'testtest', 1);
INSERT INTO Coaches (Coach_ID, Coach_Name, Coach_Level, Coach_Rating, Coach_Notes, Location_ID)
VALUES(4, 'Mark', 1, 4, 'testtest', 1);

INSERT INTO reference (Reference_ID, Coach_ID, Client_ID)
VALUES (1, 1, 1);
INSERT INTO reference (Reference_ID, Coach_ID, Client_ID)
VALUES (2, 2, 2);
INSERT INTO reference (Reference_ID, Coach_ID, Client_ID)
VALUES (3, 3, 3);

INSERT INTO Clients (Client_ID, Client_Name, Client_Phone, Client_Email, Coach_ID)
VALUES(1, 'Alex', 123434325, 'test@test.com', 3);
INSERT INTO Clients (Client_ID, Client_Name, Client_Phone, Client_Email, Coach_ID)
VALUES(2, 'Jane', 123434325, 'test@test.com', 2);
INSERT INTO Clients (Client_ID, Client_Name, Client_Phone, Client_Email, Coach_ID)
VALUES(3, 'Sally', 123434325, 'test@test.com', 1);

INSERT INTO Certificates (Certificate_ID, Certificate_Name, Coach_ID)
VALUES(1, 'joga', 2);
INSERT INTO Certificates (Certificate_ID, Certificate_Name, Coach_ID)
VALUES(2, 'fitness', 1);
INSERT INTO Certificates (Certificate_ID, Certificate_Name, Coach_ID)
VALUES(3, 'biking', 3);

INSERT INTO Classes (Class_ID, Class_Time, Class_Name, Class_Price, Class_Gym,
 Class_Room, Location_ID, Coach_ID)
VALUES(1, '12:30', 'joga', '23,34', 1, 3, 1, 1);
INSERT INTO Classes (Class_ID, Class_Time, Class_Name, Class_Price, Class_Gym,
 Class_Room, Location_ID, Coach_ID)
VALUES(2, '9:30', 'biking', '56,33', 2, 5, 2, 3);
INSERT INTO Classes (Class_ID, Class_Time, Class_Name, Class_Price, Class_Gym,
 Class_Room, Location_ID, Coach_ID)
VALUES(3, '5:00', 'joga', '23,34', 1, 3, 1, 1);

INSERT INTO Locations_Clients(Location_ID, Client_ID)
VALUES(1, 1);
INSERT INTO Locations_Clients(Location_ID, Client_ID)
VALUES(2, 2);
INSERT INTO Locations_Clients(Location_ID, Client_ID)
VALUES(3, 3);

INSERT INTO Reviews (Review_ID, Review_Date, Review_Communication,
 Review_Enthusiasim, Review_Punctuality, Review_Description, Coach_ID)
VALUES (1, '2021-02-03', 5, 5, 5, 'test', 1); 
INSERT INTO Reviews (Review_ID, Review_Date, Review_Communication,
 Review_Enthusiasim, Review_Punctuality, Review_Description, Coach_ID)
VALUES (2, '2021-03-23', 4, 5, 3, 'test', 2); 
INSERT INTO Reviews (Review_ID, Review_Date, Review_Communication,
 Review_Enthusiasim, Review_Punctuality, Review_Description, Coach_ID)
VALUES (3, '2021-05-05', 5, 3, 5, 'test', 3); 

INSERT INTO Amenities (Amenities_ID, Amenities_Name, Location_ID)
VALUES(1, 'sauna', 1);
INSERT INTO Amenities (Amenities_ID, Amenities_Name, Location_ID)
VALUES(2, 'green zone', 1);
INSERT INTO Amenities (Amenities_ID, Amenities_Name, Location_ID)
VALUES(3, 'hot yoga', 1);
INSERT INTO Amenities (Amenities_ID, Amenities_Name, Location_ID)
VALUES(4, 'spinning', 1);
INSERT INTO Amenities (Amenities_ID, Amenities_Name, Location_ID)
VALUES(5, 'pool', 1);
