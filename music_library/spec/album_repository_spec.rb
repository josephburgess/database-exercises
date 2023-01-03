require 'album_repository'

RSpec.describe AlbumRepository do
  def reset_albums_table
    seed_sql = File.read('spec/seeds_albums.sql')
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
end
