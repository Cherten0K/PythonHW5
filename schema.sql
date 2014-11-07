pragma foreign_keys=on;
pragma encoding = 'utf-8';

drop table if exists users;
drop table if exists costs;
drop table if exists entries;
drop table if exists categories;
drop table if exists sub_categories;

create table users (
    `login` text primary key not null,
    `password` text not null
);

create table entries (
  `id` integer primary key autoincrement,
  `user` integer references users(`login`),
  `title` text not null,
  `comment` text,
  `cost` integer references costs(`id_cost`),
  `start_date` datetime,
  `end_date` datetime
);

create table costs(
	`id_cost` integer primary key autoincrement,
	`time` datetime,
	`id_category` integer references categories(`id_category`),
	`money` integer,
	`user` integer references users(`login`)
);

create table sub_categories(
	`id_category` integer primary key autoincrement,
	`name` text not null,
	`ancessor` integer references categories(`id_category`),
	`user` integer references users(`login`)
);

create table categories(
	`id_category` integer primary key autoincrement,
	`name` text not null,
	`user` integer references users(`login`)
);