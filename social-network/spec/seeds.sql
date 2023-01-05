TRUNCATE TABLE user_accounts, posts RESTART IDENTITY;

INSERT INTO user_accounts (username, email_address) VALUES ('JoeBurgess', 'josephburgess@gmail.com');
INSERT INTO user_accounts (username, email_address) VALUES ('JohnSmith', 'johnsmith@gmail.com');
INSERT INTO user_accounts (username, email_address) VALUES ('JaneDoe', 'janedoe@gmail.com');
INSERT INTO posts (title, content, views, account_id) VALUES ('Post 1', 'This is my first post', '12', '1');
INSERT INTO posts (title, content, views, account_id) VALUES ('Post 2', 'This is my second post', '25', '2');
INSERT INTO posts (title, content, views, account_id) VALUES ('Post 3', 'This is my third post', '51', '3');