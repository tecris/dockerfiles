use bookstore;
create table book (id int not null auto_increment primary key, name varchar(25), author varchar(25), year int);
insert into book values(null, 'Cloud Atlas', 'David Mitchell', 2004);
