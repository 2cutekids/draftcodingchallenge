# Draftcodingchallenge

1) Code is using mysql 
2) rake db:create
3) rake db:migrate
5) db:seeds          -will create the sports
6)  Bringing up the server will call the cbs_sports api and populate
 the Players table
7  Anytime the players table is empty either restarting the server 
or trying an api will redo the calls to the api and reloadplaers table
I recommend shutting the server and the tables will be reloaded at startup time
otherwise the actual api call may timeout.




