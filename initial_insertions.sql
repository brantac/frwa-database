-- User 1: Common user
INSERT INTO appuser (last_name, birthdate,
userheight, userweight)
VALUES ('Abravanel', '1990-10-15', 1.72, 54.0);
-- User 2: Specialist
INSERT INTO appuser (last_name, birthdate,
userheight, userweight)
VALUES ('Makrinsk', '1985-10-15', 1.70, 72.0);

-- Relathionship types
INSERT INTO relationship_type (rtype_name)
VALUES('Friend');
INSERT INTO relationship_type (rtype_name)
VALUES('Specialist');
INSERT INTO relationship_type (rtype_name)
VALUES('Client');

-- Relationships
INSERT INTO relationship
(user_id1, user_id2, rtype_id)
VALUES(2,3,3);
INSERT INTO relationship
(user_id1, user_id2, rtype_id)
VALUES(3,2,2);