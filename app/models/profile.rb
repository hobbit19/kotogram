class Profile < ApplicationRecord
  self.primary_key = 'user_id'

  before_save { username.downcase! }

  belongs_to :user

  validates :username, presence: true, length: { within: 6..20 },
    uniqueness: { case_sensitive: false }

  mount_uploader :avatar, AvatarUploader
end