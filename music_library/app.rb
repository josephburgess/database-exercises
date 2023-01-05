require_relative 'lib/database_connection'
require_relative 'lib/album_repository'
require_relative 'lib/artist_repository'

class Application
  def initialize(database_name, io, album_repository, artist_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @album_repository = album_repository
    @artist_repository = artist_repository
  end

  def run
    show 'Welcome to the music library manager!'
    show 'What would you like to do?'
    show '1 - List all albums'
    show '2 - List all artists'
    prompt_for_input
  end

  private

  def show(message)
    @io.puts(message)
  end

  def prompt(message)
    @io.puts(message)
    @io.gets.chomp
  end

  def prompt_for_input
    input = prompt 'Enter your choice:'
    case input
    when '1'
      show 'Here is the list of albums:'
      @album_repository.all.each do |album|
        show "* #{album.id} - #{album.title} (#{album.release_year})"
      end
    else
      show 'Here is the list of artists:'
      @artist_repository.all.each do |artist|
        show "* #{artist.id} - #{artist.name} (#{artist.genre})"
      end
    end
  end
end

if __FILE__ == $0
  app = Application.new(
    'music_library',
    Kernel,
    AlbumRepository.new,
    ArtistRepository.new
  )
  app.run
end
