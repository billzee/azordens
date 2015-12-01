create table email_groups (
id int unsigned auto_increment primary key,
description varchar(40)
);

create table customers (
id int unsigned auto_increment primary key,
name varchar(40) not null,
email varchar(40) not null,
telephone varchar(14),
creation timestamp default current_timestamp,
email_group_id int unsigned not null,
last_modified timestamp on update current_timestamp,
foreign key (email_group_id) references email_groups(id)
);

create table brands (
id int unsigned auto_increment primary key,
name varchar(40)
);

create table equipments (
id int unsigned auto_increment primary key,
name varchar (40) not null,
model varchar(60),
brand_id int unsigned not null references brands(id),
description varchar(120),
creation timestamp default current_timestamp,
last_modified timestamp on update current_timestamp
);

tempo de duracao das aulas
natacao
desconto / 3 meses

510 + 30