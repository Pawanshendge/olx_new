class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image, dependent: :destroy
  
  has_many :comments, dependent: :destroy
  has_many :shops, dependent: :destroy

  has_many :likes, :as => :likeable

end
