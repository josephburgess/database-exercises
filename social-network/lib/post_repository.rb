require_relative './post'

class PostRepository
  def all
    sql = 'SELECT * FROM posts;'
    results = DatabaseConnection.exec_params(sql, [])

    posts = []
    results.each do |record|
      posts << compile_data(record)
    end
    posts
  end

  def find(id)
    sql = 'SELECT * FROM posts WHERE id = $1'
    sql_params = [id]
    result = DatabaseConnection.exec_params(sql, sql_params)
    record = result[0]
    compile_data(record)
  end

  def create(post)
    sql = 'INSERT INTO posts (title, content, views, account_id) VALUES($1, $2, $3, $4)'
    sql_params = [post.title, post.content, post.views, post.account_id]
    DatabaseConnection.exec_params(sql, sql_params)
  end

  def delete(id)
    sql = 'DELETE FROM posts WHERE id = $1'
    sql_params = [id]
    DatabaseConnection.exec_params(sql, sql_params)
  end

  def update(post)
    sql = 'UPDATE posts SET title = $1, content = $2 WHERE id = $3'
    sql_params = [post.title, post.content, post.id]
    DatabaseConnection.exec_params(sql, sql_params)
  end

  private

  def compile_data(record)
    post = Post.new
    post.id = record['id']
    post.title = record['title']
    post.content = record['content']
    post.views = record['views']
    post.account_id = record['account_id']
    post
  end
end
