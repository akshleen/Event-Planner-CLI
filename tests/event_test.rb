# tests/event_test.rb
require 'minitest/autorun'
require_relative '../event'

class EventTest < Minitest::Test
  def test_event_creation
    event = Event.new("Birthday Party", "2025-01-22", "Celebrating my 25th birthday")
    
    assert_equal "Birthday Party", event.name
    assert_equal "2025-01-22", event.date
    assert_equal "Celebrating my 25th birthday", event.description
  end

  def test_event_edit
    event = Event.new("Birthday Party", "2025-01-22", "Celebrating my 25th birthday")
    event.edit(new_name: "Surprise Party", new_date: "2025-02-14", new_description: "Surprise birthday party")

    assert_equal "Surprise Party", event.name
    assert_equal "2025-02-14", event.date
    assert_equal "Surprise birthday party", event.description
  end
end
