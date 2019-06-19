class Deed < ApplicationRecord
  has_many :gifts
  has_many :receivers, through: :gifts, source: :receiver
  has_many :givers, through: :gifts, source: :giver

  def receiver_usernames
    self.receivers.pluck(:username)
  end
end
