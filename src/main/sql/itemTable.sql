create table item(
  itemNumber int auto_increment not null,
  itemName varchar(100) not null,
  itemPrice varchar(1000) not null,
  uploadDate varchar(1000) not null,
  itemCategory varchar(100) not null,
  itemDescription varchar(5000) not null,
  itemThumbnail varchar(1000) not null,
  primary key(itemNumber)
);