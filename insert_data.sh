#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
$($PSQL "CREATE DATABASE gamesDB")

$($PSQL "CREATE TABLE games (id INTEGER NOT NULL,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    email VARCHAR(50),
    PRIMARY KEY (id))")

$($PSQL "LOAD DATA INFILE 'games.csv'
INTO TABLE games
FIELDS TERMINATED BY ','
IGNORE 1 ROWS")

