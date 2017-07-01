DROP TABLE IF EXISTS `pet`;
CREATE TABLE pet (
  name VARCHAR(20),
  owner VARCHAR(20),
  species VARCHAR(20),
  sex CHAR(1),
  birth DATE,
  death DATE);

BEGIN;
INSERT INTO `pet` VALUES
('Puffball','Diane','hamster','f','2015-03-30',NULL),
('Roxy','Indie','cat','f','2013-03-30',NULL);
COMMIT;
