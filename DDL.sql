create table Customer (
Email varchar(255) not null,
first_name varchar(255),
last_name varchar(255),
age int(3),
gender varchar(15),
primary key (Email)
);

create table Ticket (
ticket_id varchar(8) not null, 
date date,
time time,
face_value float(4,1),
primary key (ticket_id)
);

create table Seats(
seat_id varchar(8) not null, 
seat_row int(2),
number int(2),
primary key (seat_id)
);

create table Movie(
movie_id varchar(8) not null,
movie_name varchar(255),
duration int(4),
rating varchar(8)
	check (rating >= 0), 
primary key (movie_id)
);

create table genre (
movie_id varchar(8) not null,
genre varchar(20),
foreign key (movie_id) references movie(movie_id)
	on delete cascade
);

create table Screen(
screen_id varchar(8) not null,
capacity int(3),
primary key (screen_id)
);

create table Theatre(
theatre_id varchar(8) not null,
theatre_name varchar(255),
address varchar(255),
city varchar(255),
state varchar(2),
primary key(theatre_id)
);

create table Employee(
employee_id varchar(8) not null,
first_name varchar(255),
last_name varchar(255),
age int(3),
salary float,
primary key(employee_id)
);

create table Purchases(
Email varchar(255),
ticket_id varchar(8),
price float(4,1),
purchase_date date,
employee_id varchar(8),
primary key(ticket_id),
foreign key(Email) references Customer(Email)
	on delete set null,
foreign key (ticket_id) references Ticket(ticket_id)
	on delete cascade,
foreign key(employee_id) references Employee(employee_id)
	on delete set null	
);

create table ticket_seat_map (
ticket_id varchar(8),
seat_id varchar(8),
primary key (ticket_id),
foreign key (ticket_id) references Ticket(ticket_id)
	on delete cascade,
foreign key (seat_id) references Seats(seat_id)
	on delete set null
);

create table has (
seat_id varchar(8),
screen_id varchar(8),
primary key(seat_id),
foreign key (seat_id) references Seats(seat_id)
	on delete cascade,
foreign key (screen_id) references Screen(screen_id)
	on delete set null
);

create table belongs_to (
ticket_id varchar(8),
screen_id varchar(8),
movie_id varchar(8),
primary key (ticket_id),
foreign key (ticket_id) references Ticket(ticket_id)
	on delete cascade,
foreign key (screen_id) references Screen(screen_id)
	on delete set null,
foreign key (movie_id) references Movie(movie_id)
	on delete cascade
);

create table owns (
theatre_id varchar(8),
screen_id varchar(8),
primary key (theatre_id,screen_id),
foreign key (theatre_id) references Theatre(theatre_id)
	on delete cascade,
foreign key (screen_id) references Screen(screen_id)
	on delete set null
);


create table Plays_in (
movie_id varchar(8),
screen_id varchar(8),
start_date date,
end_date date,
primary key (movie_id, screen_id),
foreign key (movie_id) references Movie(movie_id)
	on delete cascade,
foreign key (screen_id) references Screen(screen_id)
	on delete cascade
);

create table Works_for (
employee_id varchar(8),
theatre_id varchar(8),
primary key (employee_id),
foreign key (employee_id) references Employee(employee_id)
	on delete cascade,
foreign key (theatre_id) references Theatre(theatre_id)
	on delete set null
);