# app.rb
require_relative 'event'

class EventPlanner
  def initialize
    @events = []
  end

  def menu
    loop do
      puts "\nEvent Planner"
      puts "1. Add Event"
      puts "2. View Events"
      puts "3. Edit Event"
      puts "4. Exit"
      print "Choose an option: "
      choice = gets.chomp.to_i

      case choice
      when 1
        add_event
      when 2
        view_events
      when 3
        edit_event
      when 4
        exit
      else
        puts "Invalid choice. Try again."
      end
    end
  end

  def add_event
    print "Enter event name: "
    name = gets.chomp
    print "Enter event date (YYYY-MM-DD): "
    date = gets.chomp
    print "Enter event description: "
    description = gets.chomp

    event = Event.new(name, date, description)
    @events << event
    puts "Event added successfully!"
  end

  def view_events
    if @events.empty?
      puts "No events to display."
    else
      @events.each_with_index do |event, index|
        puts "\nEvent ##{index + 1}:"
        puts event
      end
    end
  end

  def edit_event
    if @events.empty?
      puts "No events to edit."
      return
    end

    print "Enter the number of the event you want to edit: "
    event_number = gets.chomp.to_i - 1

    if event_number >= 0 && event_number < @events.length
      event = @events[event_number]

      print "Enter new event name (leave blank to keep current): "
      new_name = gets.chomp
      new_name = event.name if new_name.empty?

      print "Enter new event date (leave blank to keep current): "
      new_date = gets.chomp
      new_date = event.date if new_date.empty?

      print "Enter new event description (leave blank to keep current): "
      new_description = gets.chomp
      new_description = event.description if new_description.empty?

      event.edit(new_name: new_name, new_date: new_date, new_description: new_description)
      puts "Event updated successfully!"
    else
      puts "Invalid event number."
    end
  end
end

# Start the event planner
EventPlanner.new.menu
