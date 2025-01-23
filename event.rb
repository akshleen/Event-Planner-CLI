# event.rb
class Event
  attr_accessor :name, :date, :description

  def initialize(name, date, description)
    @name = name
    @date = date
    @description = description
  end

  def edit(new_name:, new_date:, new_description:)
    @name = new_name
    @date = new_date
    @description = new_description
  end

  def to_s
    "Event: #{@name}\nDate: #{@date}\nDescription: #{@description}\n"
  end
end
