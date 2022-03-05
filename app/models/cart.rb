class Cart < ApplicationRecord
  belongs_to :user
  has_many :shops, dependent: :destroy
  
end
