require 'student_repository'
require 'pg'

RSpec.describe StudentRepository do
  def reset_students_table
    seed_sql = File.read('spec/seeds_students.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'student_directory_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_students_table
  end

  it 'returns the full database with all' do
    repo = StudentRepository.new

    students = repo.all
    expect(students[0].name).to eq 'Joe'
    expect(students[3].cohort).to eq 'June 2022'
    expect(students[4].id).to eq '5'
  end

  it 'returns specific result when finding by id' do
    repo = StudentRepository.new
    student = repo.find(2)
    expect(student.name).to eq 'Elise'
  end

  it 'allows for the creation of new student records' do
    repo = StudentRepository.new
    repo.create('Paul', 'July 2022')
    students = repo.all
    expect(students[5].name).to eq 'Paul'
  end
end
