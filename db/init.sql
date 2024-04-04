

CREATE DATABASE Metall;
CREATE DATABASE Tg_metall;

CREATE USER 'Admin'@'%' IDENTIFIED BY '25072004Yp';

GRANT ALL PRIVILEGES ON Metall.* TO 'Admin'@'%';
GRANT ALL PRIVILEGES ON Tg_metall.* TO 'Admin'@'%';

create table if not exists Metall.Price
(
    Id        int auto_increment
        primary key,
    time      datetime     not null,
    City      varchar(155) not null,
    Company   varchar(155) not null,
    Name      varchar(100) not null,
    Price_Fiz float        not null,
    Price_Ur  float        not null,
    constraint Id
        unique (Id)
);



create table Tg_metall.mail
(
    id      bigint auto_increment
        primary key,
    user_id int null,
    constraint id
        unique (id)
);



# DELETE FROM Metall.Price WHERE Price_Fiz >= 0;