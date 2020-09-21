# The Gossip Project : database 
### Week 4 day 4 : thursday


This is the third project : it is a simple database with a seed.rb that generates random informations (user, tag, gossips ...) and links some of them together.
Random informations are generated thanks to faker gem.


* Ruby version : 2.5.1
* Rails version : 5.2.4.3

* Database creation
rails db:seed

* How to run the test suite
Use table_print to display tables :
tp User.all
tp City.all
tp Gossip.all
tp Tag.all
tp PrivateMessage.all
tp JoinTableGossipTag.all
