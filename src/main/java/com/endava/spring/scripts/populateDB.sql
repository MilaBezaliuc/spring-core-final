
ALTER SEQUENCE dance_mb_id_seq RESTART 1;
ALTER SEQUENCE man_mb_id_seq RESTART 1;
ALTER SEQUENCE woman_mb_id_seq RESTART 1;

DELETE FROM dance_mb;
DELETE FROM man_mb;
DELETE FROM woman_mb;

INSERT INTO man_mb(name) VALUES
  ('Petru'),
  ('Sasha'),
  ('Victor'),
  ('Max'),
  ('Serghei'),
  ('Dima'),
  ('Ion');

INSERT INTO woman_mb(name) VALUES
  ('Mila'),
  ('Iuna'),
  ('Linda'),
  ('Iulia'),
  ('Cristina'),
  ('Sveta'),
  ('Oliga');

INSERT INTO dance_mb(man_id, woman_id, style) VALUES
  (1,2,'Samba'),
  (2,1,'Latino'),
  (3,1,'Tango'),
  (4,5,'Salsa'),
  (5,6,'Cha-cha-cha'),
  (6,4,'Rumba'),
  (7,7,'Bachata'),
  (7,7,'Makarena'),
  (7,6,'Lambada');