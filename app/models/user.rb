class User < ApplicationRecord

  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :password

  has_secure_password

  def self.from_omniauth(response)
    User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
      u.username = response[:info][:name]
      u.email = response[:info][:email]
      u.password = SecureRandom.hex(15)
    end
  end
end
