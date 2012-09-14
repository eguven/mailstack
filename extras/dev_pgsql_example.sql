INSERT INTO domains (domain) VALUES
  ('dev.example.com'),
  ('sub1.example.com'),
  ('example2.com');

-- -- Note: /var/spool/mail/virtual/ is an example path for central storage
-- -- of Maildirs.

INSERT INTO users (id,password,home,mail) VALUES
  ('user1@sub1.example.com',
  MD5('user1@sub1'),
  '/var/spool/mail/virtual/sub1.example.com/user1/',
  'maildir:/var/spool/mail/virtual/sub1.example.com/user1/mail/'),

  ('admin@dev.example.com',
  MD5('admin@dev'),
  '/var/spool/mail/virtual/dev.example.com/admin/',
  'maildir:/var/spool/mail/virtual/dev.example.com/admin/mail/'),

  ('user2@sub1.example.com',
  MD5('user2@sub1'),
  '/var/spool/mail/virtual/sub1.example.com/user2/',
  'maildir:/var/spool/mail/virtual/sub1.example.com/user2/mail/'),

  ('user1@example2.com',
  MD5('user1@example2'),
  '/var/spool/mail/virtual/example2.com/',
  'maildir:/var/spool/mail/virtual/example2.com/user1/mail/');
