class User < ApplicationRecord
  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
  
  has_many :attendances
  has_many :events, through: :attendances
  has_many :administrated_events, foreign_key: 'admin_id', class_name: "Event"
end
