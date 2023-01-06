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

  it 'allows the user to find cohort information with related students' do
    repo = CohortRepository.new
    cohort = repo.find_with_students(2)
    expect(cohort.name).to eq 'Second'
    expect(cohort.students.length).to eq 2
  end
end
