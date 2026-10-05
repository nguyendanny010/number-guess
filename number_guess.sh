#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -q -c"

echo "Enter your username:"
read USERNAME

USERNAME_FROM_DB=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")

if [[ -z $USERNAME_FROM_DB ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."

  $PSQL "INSERT INTO users(username) VALUES('$USERNAME')"

  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  GAMES_PLAYED=0
  BEST_GAME=""
else
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")

  echo "Welcome back, $USERNAME_FROM_DB! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
NUMBER_OF_GUESSES=0

echo "Guess the secret number between 1 and 1000:"
read GUESS

while true
do
  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    read GUESS
    continue
  fi

  NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))

  if [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
    read GUESS
  elif [[ $GUESS -lt $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
    read GUESS
  else
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

    if [[ -z $BEST_GAME ]] || [[ $NUMBER_OF_GUESSES -lt $BEST_GAME ]]
    then
      $PSQL "UPDATE users SET games_played = games_played + 1, best_game = $NUMBER_OF_GUESSES WHERE user_id = $USER_ID"
    else
      $PSQL "UPDATE users SET games_played = games_played + 1 WHERE user_id = $USER_ID"
    fi

    break
  fi
done