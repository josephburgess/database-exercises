require_relative 'lib/cohort_repository'

class Application
  def initialize(database_name, io, cohort_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @cohort_repository = cohort_repository
  end

  def run
    cohort_id = prompt 'Enter a cohort number:'
    cohort = @cohort_repository.find_with_students(cohort_id)
    show "Here are the details of the #{cohort.name} Cohort:"
    show "Starting date: #{cohort.starting_date}"
    show 'Students:'
    cohort.students.each_with_index do |student, index|
      show "#{index + 1}. #{student.name} (id: #{student.id})"
    end
  end

  private

  def show(message)
    @io.puts(message)
  end

  def prompt(message)
    @io.puts(message)
    @io.gets
  end
end
