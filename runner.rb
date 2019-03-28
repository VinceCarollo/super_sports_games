require './lib/event'
require './lib/games'


year = ''
until year.length == 4 && year.scan(/\D/).empty?
  p "Please enter the year of your Event"
  year = gets.chomp
end

games = Games.new(year)

def create_new_event(games)
  system("Clear")
  p "Please enter the name of the event."
  event_name = gets.chomp


  ages = []

  p "Please enter the ages of all contestants one by one,"
  age = ''
  while true
    age = gets.chomp
    break if age == 'done'
    until age.scan(/\D/).empty?
      p "Please enter a number for an age"
      age = gets.chomp
    end
    ages << age.to_i
    p "Age added, Type 'done' when you are finished adding ages"
  end
  games.add_event(Event.new(event_name, ages))
end



def start(games)
  input = ''
  until input == "c" || input == 'q' || input == 's'
    system("clear")
    p "Enter c to create new Event"
    p "Enter q to quit program"
    p "Enter s for a summary of all games in your event"

    input = gets.chomp.downcase

    if input == 'c'
      create_new_event(games)
    elsif input == 'q'
      exit
    elsif input == 's'
      system("clear")
      p games.headers
      p "=" * 90
      print games.all_events_summary + ("\n")
      print ("\n")
      until input == 'e'
        p "Enter e to exit summary"
        input = gets.chomp.downcase
      end
    end
    start(games)
  end
end

start(games)
