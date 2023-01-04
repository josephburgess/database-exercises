CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name text,
  cohort_id int,
  constraint fk_cohort foreign key(cohort_id)
  references cohorts(id)
  on delete cascade
);

CREATE TABLE cohorts (
  id SERIAL PRIMARY KEY
  name text,
  start_date text
)


-- As a coach
-- So I can get to know all students
-- I want to see a list of students' names.

-- As a coach
-- So I can get to know all students
-- I want to see a list of cohorts' names.

-- As a coach
-- So I can get to know all students
-- I want to see a list of cohorts' starting dates.

-- As a coach
-- So I can get to know all students
-- I want to see a list of students' cohorts.
