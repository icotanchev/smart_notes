CREATE DATABASE IF NOT EXISTS smart_notes;

USE smart_notes;

CREATE TABLE IF NOT EXISTS users (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY(id)
);

CREATE INDEX index_users_name ON users(name);

CREATE TABLE IF NOT EXISTS tokens (
  id INT NOT NULL AUTO_INCREMENT,
  token VARCHAR(40) NOT NULL,
  user_id INT NOT NULL UNIQUE,
  PRIMARY KEY(id),
  FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE INDEX index_tokens_token ON tokens(token);
CREATE INDEX index_tokens_user_id ON tokens(user_id);

CREATE TABLE IF NOT EXISTS notes (
  id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(255),
  description VARCHAR(255),
  user_id INT NOT NULL UNIQUE,
  subject VARCHAR(255) NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE INDEX index_notes_title ON notes(title);
CREATE INDEX index_notes_user_id ON notes(user_id);
CREATE INDEX index_notes_subject ON notes(subject);

CREATE TABLE IF NOT EXISTS places (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255),
  place_id VARCHAR(255),
  rating FLOAT,
  address VARCHAR(255),
  location POINT NOT NULL,
  PRIMARY KEY(id)
);

CREATE INDEX index_places_title ON places(name);
CREATE INDEX index_places_user_id ON places(place_id);
CREATE INDEX index_places_subject ON places(rating);
CREATE INDEX index_places_address ON places(address);
