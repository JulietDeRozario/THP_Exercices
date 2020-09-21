require 'time'
require_relative '../calendar/lib/user'
require_relative '../calendar/lib/event'

#=====> Using the User class
#If you want to create a new user, write "user = User.new("user.mail", user_age), then, you can interract with it, by using user.age for example.
#You can also use the methods User.find_by_email("wanted_email"), or User.all to puts all the users that you created.

#=====> Using the Event class
#If you want to create a new event, write "my_event = Event.new(start_date, duration, title, attendes)", then you can interract with it, by using my_event.title for example.
#You can also use the methods my_event.postpone_24h to remplace the date of your event by the next day, my_event.is_past?/is_future?/is_soon? to have more informations your event.

#=====> Using the Event creator class
def event_creator
 require_relative '../calendar/lib/event_creator'
end
#event_creator
#If you want to use it, just remove the "#" before "event_creator", and run app.rb !

binding.pry
