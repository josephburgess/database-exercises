require_relative '../lib/cohort_repository'

describe CohortRepository do
  def reset_tables
    seed_sql = File.read('spec/students_cohorts_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'student_directory_2_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_tables
  end
end
