create table admin(
  adminID varchar(30) not null,
  adminPassword varchar(50) not null,
  primary key(adminID)
);

INSERT INTO admin VALUES('administrator', 'administrator');