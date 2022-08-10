class User < ApplicationRecord
  has_secure_password
  before_create :api_key_create


  validates :email, presence: true
  validates_uniqueness_of :email

  def api_key_create
    if self.api_key == nil
      self.api_key = SecureRandom.base64(27)
    end
  end
end
