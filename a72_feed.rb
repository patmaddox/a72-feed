require 'time'

module A72Feed
  def self.google_meeting_to_tsml(gm)
    {
      "name" => gm[0],
      "slug" => gm[1],
      "time" => time(gm[2]),
      "location" => gm[11],
      "notes" => gm[13],
      "updated" => gm[18],
      "types" => types(gm[14]),
      "address" => gm[5],
      "city" => gm[6],
      "state" => gm[7],
      "postal_code" => gm[8],
      "country" => gm[9]
    }
  end

  def self.time(s)
    Time.parse(s).strftime("%H:%M") rescue ""
  end

  def self.types(s)
    s.split(",").map(&:strip)
  end
end