class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
    has_many :likes, :as => :likeable
  
end
