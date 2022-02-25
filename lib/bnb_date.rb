class BnbDate < Sequel::Model

  def self.usable_dates_by_space(space_id:)
    result = DB["SELECT * FROM bnb_dates b WHERE b.date_id NOT IN (SELECT date_id FROM available_dates WHERE space_id = #{space_id})"]

    result_array = []
    result.each do |date| 
      result_array << self.find(date_id: date[:date_id])
    end
    result_array
  end

end