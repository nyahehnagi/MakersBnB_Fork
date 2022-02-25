# frozen_string_literal: true

class BnbDate < Sequel::Model
  def self.usable_dates_by_space(space_id:)
    result = DB["SELECT * FROM bnb_dates b WHERE b.date_id NOT IN (SELECT date_id FROM available_dates WHERE space_id = #{space_id})"]

    usable_dates = []
    result.each do |date|
      usable_dates << find(date_id: date[:date_id])
    end
    usable_dates
  end
end
