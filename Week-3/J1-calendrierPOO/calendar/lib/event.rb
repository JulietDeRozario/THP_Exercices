require 'pry'
require 'bundler'
Bundler.require

class Event
    attr_accessor :start_date, :duration, :title, :attendes
    @@guests_names = []

    def initialize(start_date, duration, title, attendes)
        @start_date = Time.parse(start_date) 
        @duration = duration
        @title = title
        @attendes = attendes
        @@guests_names << self
    end

    def postpone_24h
        @start_date += 86400
        return self
    end

    def end_date
        @start_date += @duration*60
    end

    def is_past?
        @start_date < Time.now
    end

    def is_future?
        @start_date > Time.now
    end

    def is_soon?
        @start_date <= (Time.now + 30*60)
    end

    def to_s
        puts "Title: " + title
        puts "Start date: #{start_date}"
        puts "Duration: #{duration} min"
        puts "Guests: #{attendes.join(", ")}"
    end

#binding.pry
end


