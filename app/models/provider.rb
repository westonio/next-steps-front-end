class Provider < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true, length: { is: 2 }
  validates :zipcode, presence: true, length: { is: 5 }
  validates :phone, presence: true
end
