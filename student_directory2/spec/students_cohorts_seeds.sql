TRUNCATE TABLE students, cohorts RESTART IDENTITY; 

INSERT INTO students (name, cohort_id) VALUES ('Joe', '1' );
INSERT INTO students (name, cohort_id) VALUES ('Elise', '2' );
INSERT INTO students (name, cohort_id) VALUES ('Tara', '3');
INSERT INTO students (name, cohort_id) VALUES ('Aaron', '3');
INSERT INTO students (name, cohort_id) VALUES ('Peyman', '2');

INSERT INTO cohorts (name, starting_date) VALUES ('First', 'April')
INSERT INTO cohorts (name, starting_date) VALUES ('Second', 'May')
INSERT INTO cohorts (name, starting_date) VALUES ('Third', 'June')