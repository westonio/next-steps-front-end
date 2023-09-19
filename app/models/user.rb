class User < ApplicationRecord

  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :password

  has_secure_password

  enum role: %w[default manager admin]
end
