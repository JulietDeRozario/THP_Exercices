require 'pry'
require 'bundler'
Bundler.require

class User
    attr_accessor :email, :age
    @@users_array = []
    
    def initialize(email, age)
        @email = email
        @age = age
        @@users_array << self
    end

    def self.all
        return @@users_array
    end

    def self.find_by_email(mail_to_find)
        @@users_array.each do |user|
            if user.email == mail_to_find
                return user
            end
        end
    end

#binding.pry

end