require_relative '../app'

describe Application do
  def reset_tables
    seed_sql = File.read('spec/students_cohorts_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'student_directory_2_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_tables
  end

  it 'prompts the user to select a cohort' do
    database_name = 'student_directory_2_test'
    io = double(:io)
    cohort_repository = CohortRepository.new
    app = Application.new(database_name, io, cohort_repository)
    expect(io).to receive(:puts).with('Enter a cohort number:')
    expect(io).to receive(:gets).and_return('2')
    expect(io).to receive(:puts).with('Here are the details for the First Cohort:')
    expect(io).to receive(:puts).with('Starting date: x')
    expect(io).to receive(:puts).with('Students:')
    expect(io).to receive(:puts).with('1. Elise')
    expect(io).to receive(:puts).with('2. Peyman')
    app.run
  end