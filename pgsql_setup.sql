-- create database for mail
-- create tables
-- note that these are for MTA / MDA purposes

-- create psql role
-- Postfix and Dovecot only requires read access

CREATE DATABASE {{maildbname}};
\c {{maildbname}};

-- domains table is for existence lookup of domains --
CREATE TABLE domains (
  domain VARCHAR(128) NOT NULL,
  PRIMARY KEY ( domain )
);

-- users table is for IMAP logins as well as Dovecot LDA info (mail/home etc.) --
CREATE TABLE users (
  id VARCHAR(128) NOT NULL,
  password VARCHAR(128) NOT NULL,
  name VARCHAR(128),
  home VARCHAR(255) NOT NULL,
  mail VARCHAR(255) NOT NULL,
  uid INTEGER NOT NULL DEFAULT {{mailowneruserid}},
  gid INTEGER NOT NULL DEFAULT {{mailowneruserid}},
  PRIMARY KEY ( id )
);

-- aliases table is for mail forwarding --
CREATE TABLE aliases (
  source VARCHAR(128) NOT NULL,
  destination VARCHAR(128) NOT NULL,
  PRIMARY KEY ( source, destination )
);

CREATE ROLE {{maildbusername}} NOSUPERUSER NOCREATEDB NOCREATEROLE INHERIT LOGIN PASSWORD '{{maildbuserpw}}';
GRANT SELECT ON domains, users, aliases TO {{maildbusername}};
