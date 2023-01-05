require_relative '../lib/post_repository'

RSpec.describe PostRepository do
  def reset_posts_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_posts_table
  end

  it 'returns the list of all posts when calling all method' do
    repo = PostRepository.new

    posts = repo.all
    expect(posts.length).to eq 3
    expect(posts[0].title).to eq 'Post 1'
    expect(posts[1].content).to eq 'This is my second post'
    expect(posts[2].views).to eq '51'
    expect(posts[2].account_id).to eq '3'
  end

  it 'allows the user to search for individual ids' do
    repo = PostRepository.new

    post = repo.find(1)
    expect(post.title).to eq 'Post 1'
    expect(post.content).to eq 'This is my first post'
  end

  it 'allows the creation of new post entries in the database' do
    repo = PostRepository.new
    post = Post.new
    post.title = 'Post 4'
    post.content = 'This is my fourth post.'
    post.views = '6'
    post.account_id = '3'

    repo.create(post)
    all_posts = repo.all
    expect(all_posts[3].title).to eq 'Post 4'
    expect(all_posts[3].content).to eq 'This is my fourth post.'
    expect(all_posts[3].views).to eq '6'
    expect(all_posts[3].account_id).to eq '3'
  end

  it 'allows for the deletion of post entries in the database' do
    repo = PostRepository.new

    repo.delete(1)
    posts = repo.all
    expect(posts[0].title).to eq 'Post 2'
  end

  it 'allows the updating of posts' do
    repo = PostRepository.new
    post = repo.find(1)
    post.title = 'New title'
    post.content = 'Updated content'

    repo.update(post)
    updated_post = repo.find(1)
    expect(updated_post.title).to eq 'New title'
    expect(updated_post.content).to eq 'Updated content'
  end
end
