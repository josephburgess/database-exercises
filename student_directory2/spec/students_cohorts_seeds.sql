TRUNCATE TABLE students, cohorts RESTART IDENTITY; 
INSERT INTO cohorts (name, starting_date) VALUES ('First', '2023-04-01');
INSERT INTO cohorts (name, starting_date) VALUES ('Second', '2023-05-01');
INSERT INTO cohorts (name, starting_date) VALUES ('Third', '2023-06-01');

INSERT INTO students (name, cohort_id) VALUES ('Joe', '1' );
INSERT INTO students (name, cohort_id) VALUES ('Elise', '2' );
INSERT INTO students (name, cohort_id) VALUES ('Tara', '3');
INSERT INTO students (name, cohort_id) VALUES ('Aaron', '3');
INSERT INTO students (name, cohort_id) VALUES ('Peyman', '2');
