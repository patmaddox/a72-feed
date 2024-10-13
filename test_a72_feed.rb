require 'test/unit'
require_relative 'a72_feed'

class A72FeedTest < Test::Unit::TestCase
  def test_google_meeting_to_tsml
    google_meeting = [
      name = "a wonderful meeting",
      id = "meeting-id",
      time = "8:00 AM",
      day = "Sunday",
      end_time = "",
      address = "123 Main St",
      city = "New York",
      state = "NY",
      postal_code = "10001",
      country = "USA",
      coordinates = "",
      location = "a meeting hall",
      district = "District 10",
      notes = "this is my favorite meeting",
      types = "O, TC, EN",
      conference_url = "",
      conference_phone = "",
      venmo = "",
      updated = "2024-01-02 00:00:00",
      wwnotes = "",
      wwname = "",
      wwonlinenotes = ""
    ]

    tsml_meeting = A72Feed.google_meeting_to_tsml(google_meeting)

    assert_equal tsml_meeting, {
      "name" => name,
      "slug" => id,
      "day" => 0,
      "time" => "08:00",
      "timezone" => "America/Los_Angeles",
      "location" => location,
      "notes" => notes,
      "updated" => updated,
      "types" => ["O", "TC", "EN"],
      "address" => address,
      "city" => city,
      "state" => state,
      "postal_code" => postal_code,
      "country" => country
    }
  end
end
