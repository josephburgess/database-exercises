require 'album_repository'

RSpec.describe AlbumRepository do
  def reset_albums_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_albums_table
  end

  it 'returns the list of albums' do
    repo = AlbumRepository.new

    albums = repo.all
    expect(albums.length).to eq 2
    expect(albums[1].id).to eq '2'
    expect(albums[0].title).to eq 'Parklife'
  end

  it 'allows to search for individual ids' do
    repo = AlbumRepository.new

    album = repo.find(1)
    expect(album.title).to eq 'Parklife'
    expect(album.release_year).to eq '1995'
  end

  it 'allows the creation of new album entries to the database' do
    repository = AlbumRepository.new

    album = Album.new
    album.title = 'Trompe le Monde'
    album.release_year = 1991
    album.artist_id = 1

    repository.create(album)
    all_albums = repository.all
    expect(all_albums[2].title).to eq 'Trompe le Monde'
    expect(all_albums[2].release_year).to eq '1991'
    expect(all_albums[2].artist_id).to eq '1'
  end
  # The all_albums array should contain the new Album object
end
