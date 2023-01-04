require 'book_repository'

RSpec.describe BookRepository do
  def reset_books_table
    seed_sql = File.read('spec/seeds_book_store.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_books_table
  end

  it 'returns all books when calling the all method' do
    repo = BookRepository.new

    books = repo.all
    expect(books[0].title).to eq 'A Game of Thrones'
    expect(books.length).to eq 4
    expect(books[2].author_name).to eq 'Douglas Adams'
  end
end
