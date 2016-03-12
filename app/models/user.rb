class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages, dependent: :destroy, inverse_of: :user

  has_many :relationships, foreign_key: 'follower_id', dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :followed_user_messages, through: :followed_users, source: :messages, class_name: 'Message'

  has_many :reverse_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  validates :username, presence: true, uniqueness: true, format: {with: /\A[a-zA-Z0-9_\-]+\z/}

  scope :with_messages, -> {joins(:messages)}

  def follow(user)
    self.followed_users << user unless self.followed_users.include?(user)
  end

  def unfollow(user)
    self.relationships.find_by(followed_id: user.id).destroy if self.relationships.find_by(followed_id: user.id).present?
  end

end
