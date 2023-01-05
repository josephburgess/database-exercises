require_relative './user_account'
class UserAccountRepository
  def all
    sql = 'SELECT * FROM user_accounts;'
    results = DatabaseConnection.exec_params(sql, [])

    accounts = []
    results.each do |record|
      account = UserAccount.new
      account.id = record['id']
      account.username = record['username']
      account.email_address = record['email_address']
      accounts << account
    end
    accounts
  end

  def find(id)
    sql = 'SELECT * FROM user_accounts WHERE id = $1;'
    sql_params = [id]
    result = DatabaseConnection.exec_params(sql, sql_params)
    record = result[0]
    account = UserAccount.new
    account.id = record['id']
    account.username = record['username']
    account.email_address = record['email_address']
    account
  end

  def create(useraccount)
    sql = 'INSERT INTO user_accounts (username, email_address) VALUES ($1, $2);'
    sql_params = [useraccount.username, useraccount.email_address]
    DatabaseConnection.exec_params(sql, sql_params)
  end

  def delete(id)
    sql = 'DELETE FROM user_accounts WHERE id = $1'
    sql_params = [id]

    DatabaseConnection.exec_params(sql, sql_params)
  end

  def update(useraccount)
    sql = 'UPDATE user_accounts SET username = $1, email_address = $2 WHERE id = $3'
    sql_params = [useraccount.username, useraccount.email_address, useraccount.id]
    DatabaseConnection.exec_params(sql, sql_params)
  end
end
