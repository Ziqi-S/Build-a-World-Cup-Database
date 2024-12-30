#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT SUM(winner_goals + opponent_goals) from games")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "select avg(winner_goals) from games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "select round(avg(winner_goals),2) from games")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "select avg(winner_goals + opponent_goals) from games")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "select max(winner_goals) from games")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "select count(*) from games where winner_goals > 2")"

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "select name from games, teams where games.winner_id = teams.team_id and year = 2018 and round = 'Final'")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "select distinct(name) from teams, (select winner_id as teams_id from games where year = 2014 and round = 'Eighth-Final' UNION select opponent_id from games where year = 2014 and round = 'Eighth-Final') as games1 where teams.team_id = games1.teams_id order by name asc")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "select distinct(name) from teams, games where teams.team_id = games.winner_id order by name asc")"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "select year, name from games, teams where games.winner_id = teams.team_id and round = 'Final' order by year asc")"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "select name from teams where name like 'Co%'")"
