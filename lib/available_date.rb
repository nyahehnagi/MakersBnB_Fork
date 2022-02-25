# frozen_string_literal: true

class AvailableDate < Sequel::Model
  def self.find_by_id(space_id:)
    where(space_id: space_id).all
  end
end
