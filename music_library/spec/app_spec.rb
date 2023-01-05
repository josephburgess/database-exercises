require_relative '../app'

describe Application do
  def reset_tables
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end

  before :each do
    reset_tables
  end

  it 'prompts the user with a list of options' do
    database_name = 'music_library_test'
    io = double(:io)
    album_repository = AlbumRepository.new
    artist_repository = ArtistRepository.new
    app = Application.new(database_name, io, album_repository, artist_repository)
    expect(io).to receive(:puts).with('Welcome to the music library manager!')
    expect(io).to receive(:puts).with('What would you like to do?')
    expect(io).to receive(:puts).with('1 - List all albums')
    expect(io).to receive(:puts).with('2 - List all artists')
    expect(io).to receive(:puts).with('Enter your choice:')
    expect(io).to receive(:gets).and_return('1')
    expect(io).to receive(:puts).with('Here is the list of albums:')
    expect(io).to receive(:puts).with('* 1 - Parklife (1995)')
    expect(io).to receive(:puts).with('* 2 - Demon Days (2005)')
    app.run
  end
end
