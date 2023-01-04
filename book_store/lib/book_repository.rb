require_relative './book'
class BookRepository
  def all
    sql = 'SELECT id, title, author_name FROM books'
    set_of_results = DatabaseConnection.exec_params(sql, [])

    books = []
    set_of_results.each do |record|
      book = Book.new
      book.id = record['id']
      book.title = record['title']
      book.author_name = record['author_name']

      books << book
    end
    books
  end
end
