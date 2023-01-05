-- As a social network user,
-- So I can have my information registered,
-- I'd like to have a user account with my email address.

-- As a social network user,
-- So I can have my information registered,
-- I'd like to have a user account with my username.

-- As a social network user,
-- So I can write on my timeline,
-- I'd like to create posts associated with my user account.

-- As a social network user,
-- So I can write on my timeline,
-- I'd like each of my posts to have a title and a content.

-- As a social network user,
-- So I can know who reads my posts,
-- I'd like each of my posts to have a number of views.


CREATE TABLE user_accounts (
  id SERIAL PRIMARY KEY,
  username text,
  email_address text
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title text,
  content text,
  views int,
  account_id int,
  constraint fk_user_account foreign key(account_id)
  references user_accounts(id)
  on delete cascade
);