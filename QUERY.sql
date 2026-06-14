CREATE TABLE Users (
  user_id serial PRIMARY KEY,
  full_name varchar(100) NOT NULL,
  email varchar(100) UNIQUE,
  role varchar(50) CHECK (role IN ('Ticket Manager', 'Football Fan')),
  phone_number varchar(25)
);
