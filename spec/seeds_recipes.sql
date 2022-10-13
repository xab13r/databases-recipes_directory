TRUNCATE TABLE books RESTART IDENTITY;

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO "recipes" ("id", "name", "cooking_time", "rating") VALUES (1, 'Corn Bread', 60, 4);
INSERT INTO "recipes" ("id", "name", "cooking_time", "rating") VALUES (2, 'Sweet Potato Curry', 90, 5);
INSERT INTO "recipes" ("id", "name", "cooking_time", "rating") VALUES (3, 'Apple Pie', 45, 4);
INSERT INTO "recipes" ("id", "name", "cooking_time", "rating") VALUES (4, 'Red Lentils Dahl', 45, 5);