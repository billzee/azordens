create table users(
id int unsigned auto_increment primary key,
first_name varchar(40) not null,
last_name varchar(40) not null,
creation timestamp default current_timestamp,
last_modified timestamp on update current_timestamp,
email varchar(120) not null,
pw varchar(32) not null
);

create table brands (
id int unsigned auto_increment primary key,
name varchar(40),
user_id int unsigned not null,
foreign key (user_id) references users(id)
);

create table customer_groups (
id int unsigned auto_increment primary key,
description varchar(40),
user_id int unsigned not null,
foreign key (user_id) references users(id)
);

create table customers (
id int unsigned auto_increment primary key,
customer_group_id int unsigned not null,
first_name varchar(40) not null,
last_name varchar(40) not null,
company varchar(120),
email varchar(120) not null,
telephone varchar(14),
creation timestamp default current_timestamp,
last_modified timestamp on update current_timestamp,
foreign key (customer_group_id) references customer_groups(id)
);

create table equipments (
id int unsigned auto_increment primary key,
brand_id int unsigned not null,
name varchar (40) not null,
model varchar(60),
description varchar(256),
creation timestamp default current_timestamp,
last_modified timestamp on update current_timestamp,
foreign key (brand_id) references brands(id),
user_id int unsigned not null,
foreign key (user_id) references users(id)
);

create table finished_states(
id int unsigned auto_increment primary key,
warranty boolean not null,
service varchar(256) not null,
total double not null,
creation timestamp default current_timestamp,
closure timestamp
);

create table orders(
id int unsigned auto_increment primary key,
customer_id int unsigned not null,
equipment_id int unsigned not null,
finished_state_id int unsigned,
defect varchar(256),
serial_number varchar(120),
accessories varchar(256),
observation varchar(256),
creation timestamp default current_timestamp,
last_modified timestamp on update current_timestamp,
status int unsigned,
foreign key (customer_id) references customers(id),
foreign key (equipment_id) references equipments(id),
foreign key (finished_state_id) references finished_states(id),
user_id int unsigned not null,
foreign key (user_id) references users(id)
);

create table promotions(
id int unsigned auto_increment primary key,
customer_group_id int unsigned not null,
subject varchar(120),
foreign key (customer_group_id) references customer_groups(id),
user_id int unsigned not null,
foreign key (user_id) references users(id)
);



