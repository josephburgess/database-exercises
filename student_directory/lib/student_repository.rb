require_relative './student'

class StudentRepository
  def all
    sql = 'SELECT id, name, cohort FROM students;'
    result_set = DatabaseConnection.exec_params(sql, [])

    students = []
    result_set.each do |record|
      student = Student.new
      student.id = record['id']
      student.name = record['name']
      student.cohort = record['cohort']
      students << student
    end

    students
  end

  def find(id)
    sql = 'SELECT id, name, cohort FROM students WHERE id = $1'
    result = DatabaseConnection.exec_params(sql, [id])
    record = result[0]
    student = Student.new
    student.id = record['id']
    student.name = record['name']
    student.cohort = record['cohort']
    student
  end

  def create(name, cohort)
    sql = "INSERT INTO students (name, cohort) VALUES ('#{name}', '#{cohort}')"
    DatabaseConnection.exec_params(sql, [])
  end

  def update(student); end

  def delete(student); end
end
