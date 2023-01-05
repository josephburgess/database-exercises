require 'user_account_repository'

RSpec.describe UserAccountRepository do
  def reset_user_accounts_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_user_accounts_table
  end

  it 'returns the list of user accounts' do
    repo = UserAccountRepository.new

    accounts = repo.all
    expect(accounts.length).to eq 3
    expect(accounts[0].username).to eq 'JoeBurgess'
    expect(accounts[1].email_address).to eq 'johnsmith@gmail.com'
  end

  it 'allows for searching individual ids' do
    repo = UserAccountRepository.new

    account = repo.find(1)
    expect(account.username).to eq 'JoeBurgess'
    expect(account.email_address).to eq 'josephburgess@gmail.com'
  end

  it 'allows the creation of new user account entries' do
    repo = UserAccountRepository.new
    account = UserAccount.new
    account.username = 'JamesSmith'
    account.email_address = 'jamessmith@gmail.com'
    repo.create(account)
    all_accounts = repo.all
    expect(all_accounts[3].username).to eq 'JamesSmith'
    expect(all_accounts[3].email_address).to eq 'jamessmith@gmail.com'
  end

  it 'allows the deletion of user account entries' do
    repo = UserAccountRepository.new

    repo.delete(1)
    all_accounts = repo.all
    expect(all_accounts[0].username).to eq 'JohnSmith'
    expect(all_accounts[0].email_address).to eq 'johnsmith@gmail.com'
  end

  it 'updates an account' do
    repo = UserAccountRepository.new
    account = repo.find(1)

    account.username = 'different'
    account.email_address = 'different@gmail.com'

    repo.update(account)

    updated_account = repo.find(1)
    expect(updated_account.username).to eq 'different'
    expect(updated_account.email_address).to eq 'different@gmail.com'
  end
end
