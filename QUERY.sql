CREATE TABLE Users (
  user_id serial PRIMARY KEY,
  full_name varchar(100) NOT NULL,
  email varchar(100) UNIQUE,
  role varchar(50) CHECK (role IN ('Ticket Manager', 'Football Fan')),
  phone_number varchar(25)
);


CREATE TABLE Matches (
  match_id serial PRIMARY KEY,
  fixture text NOT NULL,
  tournament_category varchar(255) NOT NULL,
  base_ticket_price decimal(10, 2) NOT NULL CHECK (base_ticket_price >= 0),
  match_status varchar(50) NOT NULL CHECK (
    match_status IN (
      'Available',
      'Selling Fast',
      'Sold Out',
      'Postponed'
    )
  )
);


CREATE TABLE Bookings (
  booking_id serial PRIMARY KEY,
  user_id int NOT NULL REFERENCES Users (user_id),
  match_id int NOT NULL REFERENCES Matches (match_id),
  seat_number varchar(10),
  payment_status varchar(50) CHECK (payment_status IN ('Pending', 'Confirmed', 'Cancelled', 'Refunded')),
  total_cost decimal(10, 2) NOT NULL CHECK (total_cost >= 0)
);
