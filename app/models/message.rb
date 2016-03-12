class Message < ActiveRecord::Base

  belongs_to :user

  scope :order_by_recent_date, -> { order(created_at: :desc)}

  validates :text, length: { maximum: 160 }, presence: true
  validates :user, presence: true


end
