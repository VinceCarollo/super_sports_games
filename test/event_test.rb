require 'minitest/autorun'
require 'minitest/pride'
require './lib/event'

class EventTest < Minitest::Test
  attr_reader :event

  def setup
    @event = Event.new("Baseball", [24, 30, 18, 20, 41])
  end

  def test_it_exists
    assert_instance_of Event, event
  end

  def test_it_has_attributes
    expected = [24, 30, 18, 20, 41]

    assert_equal "Baseball", event.name
    assert_equal expected, event.ages
  end

  def test_it_can_retreive_min_and_max_age
    assert_equal 20, event.min_age
    assert_equal 41, event.max_age
  end

  def test_it_can_find_avg_age
    assert_equal 26.6, event.average_age
  end

  def test_it_can_find_standard_deviation
    assert_equal 8.28, event.standard_deviation_age
  end

end
