require_relative './album'
class AlbumRepository
  def all
    sql = 'SELECT id, title, release_year FROM albums;'
    result_set = DatabaseConnection.exec_params(sql, [])

    albums = []
    result_set.each do |record|
      album = Album.new
      album.id = record['id']
      album.title = record['title']
      album.release_year = record['release_year']

      albums << album
    end
    albums
  end

  def find(id)
    sql = 'SELECT id, title, release_year FROM albums WHERE id = $1;'
    sql_params = [id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
    record = result_set[0]
    album = Album.new
    album.id = record['id']
    album.title = record['title']
    album.release_year = record['release_year']

    album
  end

  # Add more methods below for each operation you'd like to implement.

  # def create(student)
  # end

  # def update(student)
  # end

  # def delete(student)
  # end
end