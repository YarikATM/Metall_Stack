

CREATE DATABASE Metall;
CREATE DATABASE Tg_metall;

CREATE USER 'Admin'@'%' IDENTIFIED BY '25072004Yp';

GRANT ALL PRIVILEGES ON Metall.* TO 'Admin'@'%';
GRANT ALL PRIVILEGES ON Tg_metall.* TO 'Admin'@'%';

create table Metall.Price
(
    Id        int          null,
    time      datetime     null,
    City      varchar(155) null,
    Company   varchar(155) null,
    Name      varchar(100) null,
    Price_Fiz float        null,
    Price_Ur  float        null
);