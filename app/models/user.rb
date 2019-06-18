class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true

  has_many :followed_users, foreign_key: :follower_id, class_name: "Follow"
  has_many :followees, through: :followed_users #Return user instances

  has_many :following_users, foreign_key: :followee_id, class_name: "Follow" #Returns Follow instances
  has_many :followers, through: :following_users #Return user instances

  has_many :given_gifts, foreign_key: :giver_id, class_name: "Gift"
  has_many :given_gifts_to, through: :given_gifts, source: :receiver

  has_many :received_gifts, foreign_key: :receiver_id, class_name: "Gift"
  has_many :received_gifts_from, through: :received_gifts, source: :giver

  has_many :received_deeds, through: :received_gifts, source: :deed
  has_many :given_deeds, through: :given_gifts, source: :deed

  # def give_gift_to(receiver_id, deed_id)
  #   byebug
  #   Gift.create(giver_id: self.id, receiver_id: receiver_id, deed_id: deed_id)
  # end

end
